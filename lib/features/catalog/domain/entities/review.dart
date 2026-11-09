import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';
part 'review.g.dart';

@freezed
abstract class Review with _$Review {
  const factory Review({
    required String id,
    required String authorName,
    required int rating,
    required String comment,
    required DateTime createdAt,

    /// Seed for the gradient avatar circle.
    @Default(0) int avatarSeed,
    String? restaurantReply,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

/// Header of the reviews screen: average, histogram and AI summary.
@freezed
abstract class ReviewSummary with _$ReviewSummary {
  const factory ReviewSummary({
    required double average,
    required int total,

    /// Count of reviews per star, keyed "1".."5".
    @Default({}) Map<String, int> distribution,
    String? aiSummary,
  }) = _ReviewSummary;

  const ReviewSummary._();

  factory ReviewSummary.fromJson(Map<String, dynamic> json) =>
      _$ReviewSummaryFromJson(json);

  /// 0..1 share of reviews with [stars] stars.
  double share(int stars) {
    if (total == 0) return 0;
    return (distribution['$stars'] ?? 0) / total;
  }
}

@freezed
abstract class ReviewPage with _$ReviewPage {
  const factory ReviewPage({
    required ReviewSummary summary,
    @Default([]) List<Review> reviews,
    @Default(1) int page,
    @Default(false) bool hasMore,
  }) = _ReviewPage;

  factory ReviewPage.fromJson(Map<String, dynamic> json) =>
      _$ReviewPageFromJson(json);
}
