import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tavada_eats/core/error/failure.dart';
import 'package:tavada_eats/core/error/result.dart';
import 'package:tavada_eats/core/l10n/l10n.dart';
import 'package:tavada_eats/core/theme/theme.dart';

class MockHydratedStorage extends Mock implements Storage {}

/// In-memory HydratedBloc storage for unit/bloc tests.
Storage buildTestHydratedStorage() {
  final storage = MockHydratedStorage();
  when(() => storage.read(any())).thenReturn(null);
  when(() => storage.write(any(), any<dynamic>())).thenAnswer((_) async {});
  when(() => storage.delete(any())).thenAnswer((_) async {});
  when(storage.clear).thenAnswer((_) async {});
  HydratedBloc.storage = storage;
  return storage;
}

extension PumpApp on WidgetTester {
  /// Pumps [widget] inside the app theme + localizations.
  Future<void> pumpApp(Widget widget, {Locale locale = const Locale('en')}) {
    return pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        locale: locale,
        supportedLocales: supportedAppLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        home: SkeletonizerConfig(
          data: AppTheme.skeleton,
          child: Scaffold(body: widget),
        ),
      ),
    );
  }
}

extension ResultTestX<T> on Either<Failure, T> {
  /// Unwraps a `Right` or fails the test with the `Failure`.
  T get requireValue => getOrElse((f) => throw StateError('Unexpected $f'));
}
