// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Review _$ReviewFromJson(Map<String, dynamic> json) => _Review(
  id: json['id'] as String,
  authorName: json['author_name'] as String,
  rating: (json['rating'] as num).toInt(),
  comment: json['comment'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  avatarSeed: (json['avatar_seed'] as num?)?.toInt() ?? 0,
  restaurantReply: json['restaurant_reply'] as String?,
);

Map<String, dynamic> _$ReviewToJson(_Review instance) => <String, dynamic>{
  'id': instance.id,
  'author_name': instance.authorName,
  'rating': instance.rating,
  'comment': instance.comment,
  'created_at': instance.createdAt.toIso8601String(),
  'avatar_seed': instance.avatarSeed,
  'restaurant_reply': ?instance.restaurantReply,
};

_ReviewSummary _$ReviewSummaryFromJson(Map<String, dynamic> json) =>
    _ReviewSummary(
      average: (json['average'] as num).toDouble(),
      total: (json['total'] as num).toInt(),
      distribution:
          (json['distribution'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toInt()),
          ) ??
          const {},
      aiSummary: json['ai_summary'] as String?,
    );

Map<String, dynamic> _$ReviewSummaryToJson(_ReviewSummary instance) =>
    <String, dynamic>{
      'average': instance.average,
      'total': instance.total,
      'distribution': instance.distribution,
      'ai_summary': ?instance.aiSummary,
    };

_ReviewPage _$ReviewPageFromJson(Map<String, dynamic> json) => _ReviewPage(
  summary: ReviewSummary.fromJson(json['summary'] as Map<String, dynamic>),
  reviews:
      (json['reviews'] as List<dynamic>?)
          ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  page: (json['page'] as num?)?.toInt() ?? 1,
  hasMore: json['has_more'] as bool? ?? false,
);

Map<String, dynamic> _$ReviewPageToJson(_ReviewPage instance) =>
    <String, dynamic>{
      'summary': instance.summary.toJson(),
      'reviews': instance.reviews.map((e) => e.toJson()).toList(),
      'page': instance.page,
      'has_more': instance.hasMore,
    };
