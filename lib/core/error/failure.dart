import 'package:equatable/equatable.dart';
import 'package:tavada_eats/core/error/app_exception.dart';

/// Domain-level error returned inside `Either<Failure, T>`.
///
/// Use `failure.localizedMessage(l10n)` (see `failure_l10n.dart`) to render a
/// user-facing message.
sealed class Failure extends Equatable {
  const Failure(this.message, {this.code});

  factory Failure.fromException(AppException e) => switch (e) {
    NetworkException() => NetworkFailure(e.message),
    TimeoutException() => const NetworkFailure('timeout'),
    UnauthorizedException() => UnauthorizedFailure(e.message),
    NotFoundException() => NotFoundFailure(e.message),
    ValidationException(:final fieldErrors) => ValidationFailure(
      e.message,
      code: e.code,
      fieldErrors: fieldErrors,
    ),
    CancelledException() => const CancelledFailure(),
    CacheException() => CacheFailure(e.message),
    ServerException() => ServerFailure(e.message, code: e.code),
  };

  final String message;
  final String? code;

  @override
  List<Object?> get props => [message, code];
}

final class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'network']) : super(code: 'network');
}

final class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.code});
}

final class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'unauthorized'])
    : super(code: 'unauthorized');
}

final class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'not_found'])
    : super(code: 'not_found');
}

final class ValidationFailure extends Failure {
  const ValidationFailure(
    super.message, {
    super.code,
    this.fieldErrors = const {},
  });

  final Map<String, String> fieldErrors;

  @override
  List<Object?> get props => [...super.props, fieldErrors];
}

final class CacheFailure extends Failure {
  const CacheFailure([super.message = 'cache']) : super(code: 'cache');
}

final class CancelledFailure extends Failure {
  const CancelledFailure() : super('cancelled', code: 'cancelled');
}

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = 'unexpected'])
    : super(code: 'unexpected');
}
