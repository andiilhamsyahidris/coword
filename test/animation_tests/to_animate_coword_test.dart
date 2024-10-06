import 'package:coword/coword.dart' as cowords;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../test_widget_screen.dart';

void toAnimateCowordAnimationTest(
    cowords.CowordAnimationType cowordAnimationType) {
  testWidgets('To animate coword animation test', (tester) async {
    await tester.pumpWidget(
      TestWidgetScreen(
        passwordController: TextEditingController(),
        confirmationPasswordController: TextEditingController(),
        cowordAnimationType: cowordAnimationType,
        animationDuration: const Duration(seconds: 2),
        appereanceDuration: const Duration(seconds: 2),
      ),
    );

    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    final Opacity opacityWidget = tester.widget<Opacity>(
      find.descendant(
        of: find.byType(cowords.Coword),
        matching: find.byType(Opacity),
      ),
    );

    expect(opacityWidget.opacity, 1.0);

    await tester.pump();
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);

    final cowordWidget = tester.widget<cowords.Coword>(
      find.byType(cowords.Coword),
    );
    expect(cowordWidget.cowordStyle.matchedColor, Colors.green);

    final Opacity updateOpacityWidget = tester.widget<Opacity>(find.descendant(
      of: find.byType(cowords.Coword),
      matching: find.byType(Opacity),
    ));

    expect(updateOpacityWidget, 0.0);
  });
}
