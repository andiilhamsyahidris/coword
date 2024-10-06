import 'package:coword/coword.dart' as cowords;
import 'package:flutter/material.dart';

/// This is a set of animations that you can use for your [cowords.Coword] widget.
/// Do not use them explicitly, use for example [CowordAnimation.fade()] instead.

enum CowordAnimationType {
  /// See also:
  /// * [ScaleTransition]
  scale,

  /// See also:
  /// * [FadeTransition]
  fade,
}
