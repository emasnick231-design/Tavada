import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

export 'package:bloc_concurrency/bloc_concurrency.dart'
    show concurrent, droppable, restartable, sequential;

/// Debounces events and cancels in-flight handlers when a newer one arrives.
/// Ideal for search-as-you-type.
EventTransformer<E> debounceRestartable<E>([
  Duration duration = const Duration(milliseconds: 300),
]) {
  return (events, mapper) =>
      restartable<E>().call(events.debounce(duration), mapper);
}

/// Throttles bursts (e.g. infinite-scroll "load more" triggers).
EventTransformer<E> throttleDroppable<E>([
  Duration duration = const Duration(milliseconds: 300),
]) {
  return (events, mapper) =>
      droppable<E>().call(events.throttle(duration), mapper);
}
