import 'package:coword/coword.dart' as cowords;
import 'package:flutter/material.dart';

import 'animation_test_utils.dart';

class TestWidgetScreen extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmationPasswordController;
  final cowords.CowordAnimationType cowordAnimationType;
  final Duration animationDuration;
  final Duration appereanceDuration;
  final bool appearanceDisappearanceFadeAnimationEnabled;

  const TestWidgetScreen({
    super.key,
    required this.passwordController,
    required this.confirmationPasswordController,
    required this.cowordAnimationType,
    required this.animationDuration,
    required this.appereanceDuration,
    this.appearanceDisappearanceFadeAnimationEnabled = true,
  });

  @override
  State<TestWidgetScreen> createState() => _TestWidgetScreenState();
}

class _TestWidgetScreenState extends State<TestWidgetScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: cowords.Coword(
            passwordController: widget.passwordController,
            confirmationPasswordController:
                widget.confirmationPasswordController,
            cowordStyle: const cowords.CowordStyle(matchedColor: Colors.green),
            cowordAnimation: AnimationTestUtils.getAnimationByType(
              cowordAnimationType: widget.cowordAnimationType,
              animationDuration: widget.animationDuration,
              appereanceDuration: widget.appereanceDuration,
            ),
          ),
        ),
      ),
    );
  }
}
