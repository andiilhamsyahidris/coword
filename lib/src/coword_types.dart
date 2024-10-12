import 'package:coword/src/coword_animation.dart';
import 'package:coword/src/coword_animation_type.dart';
import 'package:coword/src/coword_style.dart';
import 'package:flutter/material.dart';

/// A enum class to display [Coword] in various styles
enum CowordTypes {
  /// A type of [Coword] style that displays dots in each character
  dots,

  /// A type of [Coword] style that displays rectangle in each character
  rectangle,
}

///
/// A class that provides [Coword] in every styles based on [CowordTypes]
///

class CowordType extends StatefulWidget {
  final CowordTypes type;
  final CowordAnimation cowordAnimation;
  final CowordStyle cowordStyle;
  final bool? match;

  const CowordType({
    super.key,
    required this.type,
    required this.cowordAnimation,
    required this.cowordStyle,
    this.match = false,
  });

  @override
  State<CowordType> createState() => _CowordTypeState();
}

class _CowordTypeState extends State<CowordType> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _appearanceController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: widget.cowordAnimation.animationDuration,
      reverseDuration: widget.cowordAnimation.animationDuration,
      vsync: this,
    );

    _appearanceController = AnimationController(
      duration: widget.cowordAnimation.disappearanceFadeAnimationDuration,
      reverseDuration:
          widget.cowordAnimation.disappearanceFadeAnimationDuration,
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: widget.cowordAnimation.curve,
    );

    if (widget.cowordAnimation.toAnimate) {
      _animationController.forward();
      _appearanceController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getCoword();
  }

  double _getOpacity() {
    if (!widget.cowordAnimation.toAnimate) {
      return 1.0;
    } else if (!widget
        .cowordAnimation.appearanceDisappearanceFadeAnimationEnabled) {
      return 1.0;
    }
    return _appearanceController.value;
  }

  Widget _getCoword() {
    final shape = widget.type == CowordTypes.dots
        ? BoxDecoration(
            shape: BoxShape.circle,

            /// When password and confirmation password is match, we have to set color of the shape is [matchedColor]. Otherwise, set color of the shape is [unmatchedColor] if match is false
            color: widget.match!
                ? widget.cowordStyle.matchedColor
                : widget.cowordStyle.unmatchedColor,
          )
        : BoxDecoration(
            shape: BoxShape.rectangle,

            /// When password and confirmation password is match, we have to set color of the shape is [matchedColor]. Otherwise, set color of the shape is [unmatchedColor] if match is false
            color: widget.match!
                ? widget.cowordStyle.matchedColor
                : widget.cowordStyle.unmatchedColor,
          );

    Widget cowordView() {
      return AnimatedBuilder(
        animation: CurvedAnimation(
          parent: _appearanceController,
          curve: Curves.linear,
        ),
        builder: (context, child) {
          return Opacity(
            opacity: _getOpacity(),
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                width: 8,
                height: 8,
                decoration: shape,
              ),
            ),
          );
        },
      );
    }

    if (widget.cowordAnimation.toAnimate) {
      if (widget.cowordAnimation.animationType == CowordAnimationType.fade) {
        return FadeTransition(
          opacity: _animation,
          child: cowordView(),
        );
      } else if (widget.cowordAnimation.animationType ==
          CowordAnimationType.scale) {
        return ScaleTransition(
          scale: _animation,
          child: cowordView(),
        );
      }
    }

    return cowordView();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _appearanceController.dispose();
    super.dispose();
  }
}
