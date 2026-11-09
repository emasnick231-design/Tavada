import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/features/support/domain/entities/chat.dart';
import 'package:tavada_eats/features/support/domain/entities/help.dart';

/// Self-service help centre content.
abstract interface class HelpRepository {
  /// Top-level topics (without their articles).
  FutureResult<List<HelpTopic>> getTopics();

  /// A topic with its article list.
  FutureResult<HelpTopic> getTopic(String id);

  FutureResult<HelpArticle> getArticle(String id);

  FutureResult<Unit> sendArticleFeedback(
    String articleId, {
    required bool helpful,
  });
}

/// Live chat with a support agent.
abstract interface class SupportChatRepository {
  /// Opens (or resumes) the customer's active conversation.
  FutureResult<ChatThread> getThread();

  /// Posts a message (text and/or photo). Returns the updated thread, with
  /// the agent assigned once someone picks the conversation up.
  FutureResult<ChatThread> sendMessage({
    required String messageId,
    String? text,
    String? imagePath,
    String? customerName,
  });

  /// Long-poll: resolves once the agent has replied to pending messages
  /// (callers show a typing indicator meanwhile).
  FutureResult<ChatThread> awaitAgentReply({String? customerName});
}
