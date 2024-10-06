import 'package:coword/coword.dart' as cowords;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_widget_screen.dart';

void opacityCowordAnimationTest(
    cowords.CowordAnimationType cowordAnimationType) {
  if (cowordAnimationType != cowords.CowordAnimationType.fade) {
    testWidgets('Opacity coword with appereance animation test',
        (tester) async {
      await tester.pumpWidget(
        TestWidgetScreen(
          passwordController: TextEditingController(),
          confirmationPasswordController: TextEditingController(),
          cowordAnimationType: cowordAnimationType,
          animationDuration: const Duration(seconds: 2),
          appereanceDuration: const Duration(seconds: 1),
          appearanceDisappearanceFadeAnimationEnabled: true,
        ),
      );

      expect(tester.hasRunningAnimations, true);
      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, true);

      final Opacity showedOpacityWidget =
          tester.widget<Opacity>(find.descendant(
        of: find.byType(cowords.Coword),
        matching: find.byType(Opacity),
      ));

      expect(showedOpacityWidget.opacity, 1.0);

      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, true);
      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, false);

      await tester.tap(find.text('1'));

      await tester.pump();
      expect(tester.hasRunningAnimations, true);
      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, true);

      final Opacity hideOpacityWidget = tester.widget<Opacity>(
        find.descendant(
          of: find.byType(cowords.Coword),
          matching: find.byType(Opacity),
        ),
      );
      expect(hideOpacityWidget.opacity, 0.0);

      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, true);
      await tester.pump(const Duration(seconds: 1));
      expect(tester.hasRunningAnimations, false);
    });
  }
}
