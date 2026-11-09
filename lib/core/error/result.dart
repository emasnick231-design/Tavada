import 'package:fpdart/fpdart.dart';
import 'package:tavada_eats/core/error/app_exception.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/logging/app_logger.dart';

export 'package:fpdart/fpdart.dart' show Either, Left, Right, Unit, unit;

/// Standard return type of every repository method.
typedef Result<T> = Either<Failure, T>;
typedef FutureResult<T> = Future<Either<Failure, T>>;

/// Runs [body] and maps thrown [AppException]s to [Failure]s.
///
/// ```dart
/// FutureResult<Restaurant> getRestaurant(String id) =>
///     guard(() async => (await _remote.fetchRestaurant(id)).toEntity());
/// ```
Future<Either<Failure, T>> guard<T>(Future<T> Function() body) async {
  try {
    return Right(await body());
  } on AppException catch (e) {
    return Left(Failure.fromException(e));
  } on Object catch (e, s) {
    AppLogger.instance.error('Unexpected error in repository', e, s);
    return Left(UnexpectedFailure(e.toString()));
  }
}
