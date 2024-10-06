import 'package:coword/coword.dart';

class AnimationTestUtils {
  static CowordAnimation getAnimationByType({
    required CowordAnimationType cowordAnimationType,
    required Duration animationDuration,
    required Duration appereanceDuration,
    bool toAnimate = true,
    bool appearanceDisappearanceFadeAnimationEnabled = true,
  }) {
    switch (cowordAnimationType) {
      case CowordAnimationType.fade:
        return CowordAnimation.fade(
          toAnimate: toAnimate,
          animationDuration: animationDuration,
          disappearanceFadeAnimationDuration: appereanceDuration,
        );
      case CowordAnimationType.scale:
        return CowordAnimation.scale(
          toAnimate: toAnimate,
          animationDuration: animationDuration,
          disappearanceFadeAnimationDuration: appereanceDuration,
          appearanceDisappearanceFadeAnimationEnabled:
              appearanceDisappearanceFadeAnimationEnabled,
        );
    }
  }
}
