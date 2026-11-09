import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/features/support/domain/entities/chat.dart';
import 'package:tavada_eats/features/support/domain/repositories/support_repositories.dart';
import 'package:uuid/uuid.dart';

part 'support_chat_cubit.freezed.dart';

@freezed
abstract class SupportChatState with _$SupportChatState {
  const factory SupportChatState({
    @Default(ViewStatus.initial) ViewStatus status,
    ChatThread? thread,

    /// Messages not yet confirmed by the server (sending or failed).
    @Default([]) List<ChatMessage> pending,
    @Default(false) bool agentTyping,
    Failure? failure,
  }) = _SupportChatState;

  const SupportChatState._();

  List<ChatMessage> get messages => [...?thread?.messages, ...pending];

  SupportAgent? get agent => thread?.agent;
}

/// Live support chat with optimistic sends and a typing indicator while the
/// agent's reply is long-polled.
class SupportChatCubit extends Cubit<SupportChatState> {
  SupportChatCubit(this._repository, {this.customerName})
    : super(const SupportChatState());

  final SupportChatRepository _repository;
  final String? customerName;
  static const _uuid = Uuid();
  int _replyRequest = 0;

  Future<void> load() async {
    emit(state.copyWith(status: ViewStatus.loading, failure: null));
    final result = await _repository.getThread();
    if (isClosed) return;
    emit(
      result.fold(
        (f) => state.copyWith(status: ViewStatus.failure, failure: f),
        (thread) => state.copyWith(status: ViewStatus.success, thread: thread),
      ),
    );
    final last = state.thread?.messages.lastOrNull;
    if (last != null && last.isMine) unawaited(_awaitReply());
  }

  Future<void> send({String? text, String? imagePath}) async {
    final body = text?.trim();
    if ((body == null || body.isEmpty) && imagePath == null) return;
    final message = ChatMessage(
      id: _uuid.v4(),
      author: ChatAuthor.user,
      createdAt: DateTime.now(),
      text: body == null || body.isEmpty ? null : body,
      imagePath: imagePath,
      deliveryStatus: MessageDeliveryStatus.sending,
    );
    emit(state.copyWith(pending: [...state.pending, message]));
    await _deliver(message);
  }

  Future<void> retry(ChatMessage message) async {
    emit(
      state.copyWith(
        pending: [
          for (final m in state.pending)
            m.id == message.id
                ? m.copyWith(deliveryStatus: MessageDeliveryStatus.sending)
                : m,
        ],
      ),
    );
    await _deliver(message);
  }

  Future<void> _deliver(ChatMessage message) async {
    final result = await _repository.sendMessage(
      messageId: message.id,
      text: message.text,
      imagePath: message.imagePath,
      customerName: customerName,
    );
    if (isClosed) return;
    result.fold(
      (_) => emit(
        state.copyWith(
          pending: [
            for (final m in state.pending)
              m.id == message.id
                  ? m.copyWith(deliveryStatus: MessageDeliveryStatus.failed)
                  : m,
          ],
        ),
      ),
      (thread) {
        emit(
          state.copyWith(
            thread: thread,
            status: ViewStatus.success,
            pending: state.pending.where((m) => m.id != message.id).toList(),
          ),
        );
        unawaited(_awaitReply());
      },
    );
  }

  Future<void> _awaitReply() async {
    final request = ++_replyRequest;
    emit(state.copyWith(agentTyping: true));
    final result = await _repository.awaitAgentReply(
      customerName: customerName,
    );
    if (isClosed || request != _replyRequest) return;
    emit(
      state.copyWith(
        agentTyping: false,
        thread: result.getOrElse((_) => state.thread!),
      ),
    );
  }
}
