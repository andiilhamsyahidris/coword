import 'package:coword/coword.dart' as cowords;
import 'package:coword/src/coword_animation.dart';
import 'package:coword/src/coword_animation_type.dart';
import 'package:coword/src/coword_style.dart';
import 'package:coword/src/coword_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'animation_tests/first_appereance_coword_animation_test.dart';
import 'animation_tests/opacity_coword_animation_test.dart';
import 'animation_tests/to_animate_coword_test.dart';

void main() {
  group('Coword tests', () {
    final coword = cowords.Coword(
      passwordController: TextEditingController(),
      confirmationPasswordController: TextEditingController(),
      type: cowords.CowordTypes.dots,
      cowordStyle: const cowords.CowordStyle(),
      cowordAnimation: const cowords.CowordAnimation.fade(),
    );

    testWidgets('Widget should render correctly', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(coword));

      expect(find.byType(cowords.Coword), findsOneWidget);
    });

    testWidgets('Coword matched color should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(coword));

      final cowordWidget =
          tester.widget<cowords.Coword>(find.byType(cowords.Coword));

      expect(cowordWidget.cowordStyle.matchedColor, Colors.green);
    });

    testWidgets('Coword unmatched color should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(coword));

      final cowordWidget =
          tester.widget<cowords.Coword>(find.byType(cowords.Coword));

      expect(cowordWidget.cowordStyle.unmatchedColor, Colors.red);
    });

    testWidgets('Coword type should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(coword));

      final cowordWidget =
          tester.widget<cowords.Coword>(find.byType(cowords.Coword));

      expect(cowordWidget.type, CowordTypes.dots);
    });

    testWidgets('DisappereanceFadeAnimationDuration should match',
        (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(coword));

      final cowordWidget =
          tester.widget<cowords.Coword>(find.byType(cowords.Coword));

      expect(cowordWidget.cowordAnimation.disappearanceFadeAnimationDuration,
          const Duration(milliseconds: 200));
    });

    testWidgets('Animation duration should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(coword));

      final cowordWidget =
          tester.widget<cowords.Coword>(find.byType(cowords.Coword));

      expect(cowordWidget.cowordAnimation.animationDuration,
          const Duration(milliseconds: 500));
    });

    testWidgets('Curves animation should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(coword));

      final cowordWidget =
          tester.widget<cowords.Coword>(find.byType(cowords.Coword));

      expect(cowordWidget.cowordAnimation.curve, Curves.easeOutCubic);
    });

    testWidgets('Default values should match', (tester) async {
      await tester.pumpWidget(_wrapWithMaterialApp(coword));

      final cowordWidget =
          tester.widget<cowords.Coword>(find.byType(cowords.Coword));

      // Coword value itself
      expect(cowordWidget.type, CowordTypes.dots);
      expect(cowordWidget.cowordStyle, const CowordStyle());
      expect(cowordWidget.cowordAnimation, const CowordAnimation.fade());

      // Coword style value
      expect(cowordWidget.cowordStyle.matchedColor, Colors.green);
      expect(cowordWidget.cowordStyle.unmatchedColor, Colors.red);
      expect(cowordWidget.cowordStyle.size, 8);

      // Coword animation value
      expect(cowordWidget.cowordAnimation.toAnimate, true);
      expect(cowordWidget.cowordAnimation.animationDuration,
          const Duration(milliseconds: 500));
      expect(cowordWidget.cowordAnimation.disappearanceFadeAnimationDuration,
          const Duration(milliseconds: 200));
      expect(
          cowordWidget.cowordAnimation.animationType, CowordAnimationType.fade);
      expect(cowordWidget.cowordAnimation.curve, Curves.easeOutCubic);
      expect(
          cowordWidget
              .cowordAnimation.appearanceDisappearanceFadeAnimationEnabled,
          false);
    });
  });

  group('Coword animation tests', () {
    Widget getAnimationCoword(cowords.CowordAnimation animation) {
      return cowords.Coword(
        passwordController: TextEditingController(),
        confirmationPasswordController: TextEditingController(),
        cowordAnimation: animation,
      );
    }

    testWidgets('Coword animation should match', (tester) async {
      /// Just checking that assigning the specific animation in constructor
      ///
      /// Fade
      await tester.pumpWidget(
        _wrapWithMaterialApp(
          getAnimationCoword(const cowords.CowordAnimation.fade()),
        ),
      );

      cowords.Coword animationCoword = tester.widget<cowords.Coword>(
        find.byType(cowords.Coword),
      );

      expect(
        animationCoword.cowordAnimation.animationType,
        cowords.CowordAnimationType.fade,
      );

      // Scale
      await tester.pumpWidget(
        _wrapWithMaterialApp(
          getAnimationCoword(const cowords.CowordAnimation.scale()),
        ),
      );

      animationCoword = tester.widget<cowords.Coword>(
        find.byType(cowords.Coword),
      );

      expect(animationCoword.cowordAnimation.animationType,
          cowords.CowordAnimationType.scale);
    });
  });

  group('First appereance coword animation tests', () {
    firstAppereanceCowordAnimationTest(cowords.CowordAnimationType.fade);
    firstAppereanceCowordAnimationTest(cowords.CowordAnimationType.scale);
  });

  group('To animate coword animation tests', () {
    toAnimateCowordAnimationTest(cowords.CowordAnimationType.fade);
    toAnimateCowordAnimationTest(cowords.CowordAnimationType.scale);
  });

  group('Opacity coword animation tests', () {
    opacityCowordAnimationTest(cowords.CowordAnimationType.fade);
    opacityCowordAnimationTest(cowords.CowordAnimationType.scale);
  });
}

Widget _wrapWithMaterialApp(Widget testWidget) {
  return MaterialApp(home: Scaffold(body: testWidget));
}
