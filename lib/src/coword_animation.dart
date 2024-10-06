import 'package:coword/src/coword_animation_type.dart';
import 'package:flutter/widgets.dart';

class CowordAnimation {
  /// True to animate coword
  /// False to disable animation
  /// Default value is True
  ///
  final bool toAnimate;

  /// Duration of the coword animations
  /// Fade animation is created with [AnimatedOpacity]
  /// The default value is Duration(milliseconds: 500)
  final Duration animationDuration;

  /// Duration of the coword appearance and disappearance fade animations.
  /// Fade animation is created with [AnimatedOpacity].
  ///
  /// Set this to zero to skip the coword appearance and disappearance animations
  /// The default value is Duration(milliseconds: 200).
  final Duration disappearanceFadeAnimationDuration;

  /// Type of the animation for coword
  /// The default value is [CowordAnimationType.fade].
  final CowordAnimationType animationType;

  /// Controls curve of the animation
  final Curve curve;

  // Using disappearanceFadeAnimationDuration: Duration.zero is not correct, this will remove the animation entirely
  final bool appearanceDisappearanceFadeAnimationEnabled;

  const CowordAnimation.fade({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.disappearanceFadeAnimationDuration = const Duration(milliseconds: 200),
    this.curve = Curves.easeOutCubic,
  })  : animationType = CowordAnimationType.fade,
        appearanceDisappearanceFadeAnimationEnabled = false;

  const CowordAnimation.scale({
    this.toAnimate = true,
    this.animationDuration = const Duration(milliseconds: 500),
    this.disappearanceFadeAnimationDuration = const Duration(milliseconds: 200),
    this.curve = Curves.easeOutCubic,
    this.appearanceDisappearanceFadeAnimationEnabled = true,
  }) : animationType = CowordAnimationType.scale;
}
