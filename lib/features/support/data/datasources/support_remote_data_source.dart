import 'package:tavada_eats/core/network/api_client.dart';
import 'package:tavada_eats/features/support/domain/entities/chat.dart';
import 'package:tavada_eats/features/support/domain/entities/help.dart';

/// Endpoints owned by the support feature.
abstract final class SupportEndpoints {
  static const topics = '/support/topics';
  static String topic(String id) => '/support/topics/$id';
  static String article(String id) => '/support/articles/$id';
  static String articleFeedback(String id) => '/support/articles/$id/feedback';
  static const chat = '/support/chat';
  static const chatMessages = '/support/chat/messages';
  static const chatReply = '/support/chat/reply';
}

class SupportRemoteDataSource {
  SupportRemoteDataSource(this._client);

  final ApiClient _client;

  Future<List<HelpTopic>> fetchTopics() async =>
      (await _client.get<List<dynamic>>(
        SupportEndpoints.topics,
      )).map((e) => HelpTopic.fromJson(e as Map<String, dynamic>)).toList();

  Future<HelpTopic> fetchTopic(String id) async => HelpTopic.fromJson(
    await _client.get<Map<String, dynamic>>(SupportEndpoints.topic(id)),
  );

  Future<HelpArticle> fetchArticle(String id) async => HelpArticle.fromJson(
    await _client.get<Map<String, dynamic>>(SupportEndpoints.article(id)),
  );

  Future<void> sendFeedback(String id, {required bool helpful}) =>
      _client.post<Object?>(
        SupportEndpoints.articleFeedback(id),
        body: {'helpful': helpful},
      );

  Future<ChatThread> fetchThread() async => ChatThread.fromJson(
    await _client.get<Map<String, dynamic>>(SupportEndpoints.chat),
  );

  Future<ChatThread> sendMessage({
    required String id,
    String? text,
    String? imagePath,
    String? customerName,
  }) async => ChatThread.fromJson(
    await _client.post<Map<String, dynamic>>(
      SupportEndpoints.chatMessages,
      body: {
        'id': id,
        'text': ?text,
        'image_path': ?imagePath,
        'customer_name': ?customerName,
      },
    ),
  );

  Future<ChatThread> awaitReply({String? customerName}) async =>
      ChatThread.fromJson(
        await _client.post<Map<String, dynamic>>(
          SupportEndpoints.chatReply,
          body: {'customer_name': ?customerName},
        ),
      );
}
