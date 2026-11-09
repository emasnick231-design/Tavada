// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HelpTopic _$HelpTopicFromJson(Map<String, dynamic> json) => _HelpTopic(
  id: json['id'] as String,
  title: json['title'] as String,
  articles:
      (json['articles'] as List<dynamic>?)
          ?.map((e) => HelpArticleSummary.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$HelpTopicToJson(_HelpTopic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'articles': instance.articles.map((e) => e.toJson()).toList(),
    };

_HelpArticleSummary _$HelpArticleSummaryFromJson(Map<String, dynamic> json) =>
    _HelpArticleSummary(
      id: json['id'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$HelpArticleSummaryToJson(_HelpArticleSummary instance) =>
    <String, dynamic>{'id': instance.id, 'title': instance.title};

_HelpArticle _$HelpArticleFromJson(Map<String, dynamic> json) => _HelpArticle(
  id: json['id'] as String,
  topicId: json['topic_id'] as String,
  title: json['title'] as String,
  body: json['body'] as String,
);

Map<String, dynamic> _$HelpArticleToJson(_HelpArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topic_id': instance.topicId,
      'title': instance.title,
      'body': instance.body,
    };
