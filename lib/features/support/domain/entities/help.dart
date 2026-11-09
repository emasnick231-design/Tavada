import 'package:freezed_annotation/freezed_annotation.dart';

part 'help.freezed.dart';
part 'help.g.dart';

/// Help centre topic ("Order damage or quality issues").
@freezed
abstract class HelpTopic with _$HelpTopic {
  const factory HelpTopic({
    required String id,
    required String title,
    @Default([]) List<HelpArticleSummary> articles,
  }) = _HelpTopic;

  factory HelpTopic.fromJson(Map<String, dynamic> json) =>
      _$HelpTopicFromJson(json);
}

@freezed
abstract class HelpArticleSummary with _$HelpArticleSummary {
  const factory HelpArticleSummary({
    required String id,
    required String title,
  }) = _HelpArticleSummary;

  factory HelpArticleSummary.fromJson(Map<String, dynamic> json) =>
      _$HelpArticleSummaryFromJson(json);
}

/// A self-service answer ("Special request or comment wasn't applied").
@freezed
abstract class HelpArticle with _$HelpArticle {
  const factory HelpArticle({
    required String id,
    required String topicId,
    required String title,
    required String body,
  }) = _HelpArticle;

  factory HelpArticle.fromJson(Map<String, dynamic> json) =>
      _$HelpArticleFromJson(json);
}
