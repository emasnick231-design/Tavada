import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/features/support/data/datasources/support_remote_data_source.dart';
import 'package:tavada_eats/features/support/domain/entities/chat.dart';
import 'package:tavada_eats/features/support/domain/entities/help.dart';
import 'package:tavada_eats/features/support/domain/repositories/support_repositories.dart';

class HelpRepositoryImpl implements HelpRepository {
  HelpRepositoryImpl(this._remote);

  final SupportRemoteDataSource _remote;

  @override
  FutureResult<List<HelpTopic>> getTopics() => guard(_remote.fetchTopics);

  @override
  FutureResult<HelpTopic> getTopic(String id) =>
      guard(() => _remote.fetchTopic(id));

  @override
  FutureResult<HelpArticle> getArticle(String id) =>
      guard(() => _remote.fetchArticle(id));

  @override
  FutureResult<Unit> sendArticleFeedback(
    String articleId, {
    required bool helpful,
  }) => guard(() async {
    await _remote.sendFeedback(articleId, helpful: helpful);
    return unit;
  });
}

class SupportChatRepositoryImpl implements SupportChatRepository {
  SupportChatRepositoryImpl(this._remote);

  final SupportRemoteDataSource _remote;

  @override
  FutureResult<ChatThread> getThread() => guard(_remote.fetchThread);

  @override
  FutureResult<ChatThread> sendMessage({
    required String messageId,
    String? text,
    String? imagePath,
    String? customerName,
  }) => guard(
    () => _remote.sendMessage(
      id: messageId,
      text: text,
      imagePath: imagePath,
      customerName: customerName,
    ),
  );

  @override
  FutureResult<ChatThread> awaitAgentReply({String? customerName}) =>
      guard(() => _remote.awaitReply(customerName: customerName));
}
