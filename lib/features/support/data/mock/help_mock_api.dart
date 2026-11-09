import 'package:tavada_eats/core/network/mock/mock_database.dart';
import 'package:tavada_eats/core/network/mock/mock_server.dart';
import 'package:tavada_eats/features/support/data/mock/support_mock_helpers.dart';

/// Fake help centre backed by `assets/mock/support_topics.json`.
class HelpMockApi implements MockApi {
  HelpMockApi(this._db);

  final MockDatabase _db;

  @override
  List<MockRoute> get routes => [
    MockRoute.get('/support/topics', _topics),
    MockRoute.get('/support/topics/:id', _topic),
    MockRoute.get('/support/articles/:id', _article),
    MockRoute.post('/support/articles/:id/feedback', _feedback),
  ];

  Future<List<Map<String, dynamic>>> _all() => _db.collection('support_topics');

  Map<String, dynamic> _summary(Map<String, dynamic> item, String lang) => {
    'id': item['id'],
    'title': mockText(item['title'], lang),
  };

  Future<MockResponse> _topics(MockRequest req) async {
    final lang = mockLanguage(req);
    return MockResponse.ok([for (final t in await _all()) _summary(t, lang)]);
  }

  Future<MockResponse> _topic(MockRequest req) async {
    final lang = mockLanguage(req);
    for (final t in await _all()) {
      if (t['id'] != req.param('id')) continue;
      final articles = (t['articles'] as List).cast<Map<String, dynamic>>();
      return MockResponse.ok({
        ..._summary(t, lang),
        'articles': [for (final a in articles) _summary(a, lang)],
      });
    }
    return MockResponse.notFound();
  }

  Future<Map<String, dynamic>?> _findArticle(String id, String lang) async {
    for (final t in await _all()) {
      for (final a in (t['articles'] as List).cast<Map<String, dynamic>>()) {
        if (a['id'] != id) continue;
        return {
          ..._summary(a, lang),
          'topic_id': t['id'],
          'body': mockText(a['body'], lang),
        };
      }
    }
    return null;
  }

  Future<MockResponse> _article(MockRequest req) async {
    final article = await _findArticle(req.param('id')!, mockLanguage(req));
    return article == null ? MockResponse.notFound() : MockResponse.ok(article);
  }

  Future<MockResponse> _feedback(MockRequest req) async {
    final article = await _findArticle(req.param('id')!, 'en');
    if (article == null) return MockResponse.notFound();
    if (req.json['helpful'] is! bool) {
      return MockResponse.validation('helpful must be a boolean');
    }
    return MockResponse.noContent();
  }
}
