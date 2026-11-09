import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:tavada_eats/app/view/app_shell.dart';

void main() {
  Widget container(int index) => Directionality(
    textDirection: TextDirection.ltr,
    child: AnimatedBranchContainer(
      currentIndex: index,
      children: const [Text('home'), Text('profile')],
    ),
  );

  double opacityOf(WidgetTester tester, String text) => tester
      .widget<AnimatedOpacity>(
        find.ancestor(
          of: find.text(text),
          matching: find.byType(AnimatedOpacity),
        ),
      )
      .opacity;

  testWidgets('switching tabs fades the previous tab out', (tester) async {
    await tester.pumpWidget(container(1));
    await tester.pumpWidget(container(0));
    await tester.pumpAndSettle();

    expect(opacityOf(tester, 'home'), 1);
    expect(opacityOf(tester, 'profile'), 0);
    // The rendered opacity, not just the target, must reach zero.
    final profileOpacity = tester.renderObject<RenderAnimatedOpacity>(
      find.ancestor(
        of: find.text('profile'),
        matching: find.byType(AnimatedOpacity),
      ),
    );
    expect(profileOpacity.opacity.value, 0);
  });
}
