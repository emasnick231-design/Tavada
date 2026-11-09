import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tavada_eats/core/bloc/view_status.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/features/catalog/domain/entities/review.dart';
import 'package:tavada_eats/features/catalog/domain/repositories/catalog_repository.dart';

part 'reviews_cubit.freezed.dart';

@freezed
abstract class ReviewsState with _$ReviewsState {
  const factory ReviewsState({
    @Default(ViewStatus.initial) ViewStatus status,
    ReviewSummary? summary,
    @Default([]) List<Review> reviews,
    @Default(0) int page,
    @Default(false) bool hasMore,
    @Default(false) bool isLoadingMore,
    Failure? failure,
  }) = _ReviewsState;
}

/// Paginated restaurant reviews.
class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit(this._repository, this.restaurantId)
    : super(const ReviewsState());

  final CatalogRepository _repository;
  final String restaurantId;

  Future<void> load() async {
    emit(const ReviewsState(status: ViewStatus.loading));
    final result = await _repository.getReviews(restaurantId);
    if (isClosed) return;
    emit(
      result.fold(
        (f) => state.copyWith(status: ViewStatus.failure, failure: f),
        (page) => state.copyWith(
          status: ViewStatus.success,
          summary: page.summary,
          reviews: page.reviews,
          page: page.page,
          hasMore: page.hasMore,
        ),
      ),
    );
  }

  Future<void> loadMore() async {
    if (!state.hasMore || state.isLoadingMore) return;
    emit(state.copyWith(isLoadingMore: true));
    final result = await _repository.getReviews(
      restaurantId,
      page: state.page + 1,
    );
    if (isClosed) return;
    emit(
      result.fold(
        (_) => state.copyWith(isLoadingMore: false),
        (page) => state.copyWith(
          isLoadingMore: false,
          reviews: [...state.reviews, ...page.reviews],
          page: page.page,
          hasMore: page.hasMore,
        ),
      ),
    );
  }
}
