import 'package:tavada_eats/core/network/mock/mock_server.dart';

/// Language requested by the client (`Accept-Language`), `en` or `tr`.
String mockLanguage(MockRequest request) {
  final header =
      request.headers['Accept-Language'] ?? request.headers['accept-language'];
  final code = '${header ?? 'en'}'.split(RegExp('[-_,]')).first.toLowerCase();
  return code == 'tr' ? 'tr' : 'en';
}

/// Resolves `{ "en": …, "tr": … }` fixture values.
String mockText(Object? value, String lang) {
  if (value is Map) return '${value[lang] ?? value['en'] ?? ''}';
  return '${value ?? ''}';
}
