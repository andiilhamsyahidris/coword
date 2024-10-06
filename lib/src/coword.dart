import 'package:coword/src/coword_animation.dart';
import 'package:coword/src/coword_style.dart';
import 'package:coword/src/coword_types.dart';
import 'package:flutter/material.dart';

///
/// A widget that provides password confirmation functionality with visual feedback.
///
/// It provides real-time visual feedback by comparing the characters entered
/// in both fields and displays matching or unmatched indicators.
///
/// The [Coword] widget allows customization through various parameters including colors and shapes
///

class Coword extends StatefulWidget {
  /// A controller for managing the password textfield
  final TextEditingController passwordController;

  /// A controller for managing the confirmation password textfield
  final TextEditingController confirmationPasswordController;

  /// Type of [Coword] style to display
  final CowordTypes type;

  /// Contains all coword animation properties
  final CowordAnimation cowordAnimation;

  /// Contains all coword style properties
  final CowordStyle cowordStyle;

  const Coword({
    super.key,
    required this.passwordController,
    required this.confirmationPasswordController,
    this.type = CowordTypes.dots,
    this.cowordAnimation = const CowordAnimation.fade(),
    this.cowordStyle = const CowordStyle(),
  });

  @override
  State<Coword> createState() => _CowordState();
}

class _CowordState extends State<Coword> {
  final List<bool> _charComparisonResult = [];

  @override
  void initState() {
    super.initState();
    _compareCharPassword();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        _charComparisonResult.length,
        (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CowordType(
              type: widget.type,
              cowordAnimation: widget.cowordAnimation,
              cowordStyle: widget.cowordStyle,
              match: _charComparisonResult[index],
            ),
          );
        },
      ),
    );
  }

  void _compareCharPassword() {
    String password = widget.passwordController.text.trim();
    String confirmPassword = widget.confirmationPasswordController.text.trim();

    int minLength = password.length < confirmPassword.length
        ? password.length
        : confirmPassword.length;

    for (int i = 0; i < minLength; i++) {
      setState(() {
        _charComparisonResult.add(password[i] == confirmPassword[i]);
      });
    }
  }
}
