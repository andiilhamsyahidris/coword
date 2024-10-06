import 'package:coword/coword.dart' as cowords;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../animation_test_utils.dart';

void firstAppereanceCowordAnimationTest(
    cowords.CowordAnimationType cowordAnimationType) {
  testWidgets('First appereance coword animation without duration test',
      (tester) async {
    final cowords.Coword coword = cowords.Coword(
      passwordController: TextEditingController(),
      confirmationPasswordController: TextEditingController(),
      cowordAnimation: AnimationTestUtils.getAnimationByType(
        cowordAnimationType: cowordAnimationType,
        animationDuration: Duration.zero,
        appereanceDuration: Duration.zero,
      ),
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: coword)));

    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets(
      'First appereance coword animation without appereance duration test',
      (tester) async {
    final cowords.Coword coword = cowords.Coword(
      passwordController: TextEditingController(),
      confirmationPasswordController: TextEditingController(),
      cowordAnimation: AnimationTestUtils.getAnimationByType(
        cowordAnimationType: cowordAnimationType,
        animationDuration: const Duration(seconds: 1),
        appereanceDuration: Duration.zero,
      ),
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: coword)));

    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
  });

  testWidgets(
      'First appereance coword animation without animation duration test',
      (tester) async {
    final cowords.Coword coword = cowords.Coword(
      passwordController: TextEditingController(),
      confirmationPasswordController: TextEditingController(),
      cowordAnimation: AnimationTestUtils.getAnimationByType(
        cowordAnimationType: cowordAnimationType,
        animationDuration: Duration.zero,
        appereanceDuration: const Duration(seconds: 1),
      ),
    );
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: coword)));

    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
    expect(tester.hasRunningAnimations, false);
    await tester.pump(const Duration(seconds: 1));
  });
}
