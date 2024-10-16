import 'package:coword/coword.dart' as cowords;
import 'package:flutter/material.dart';

class CowordStyle {
  /// Allows to set the color of [cowords.Coword] widget if password and confirm password is matched
  /// Default value is [Colors.green]
  final Color matchedColor;

  /// Allows to set the color of [cowords.Coword] widget if password and confirm password is unmatched
  /// Default value is [Colors.red]
  final Color unmatchedColor;

  const CowordStyle({
    this.matchedColor = Colors.green,
    this.unmatchedColor = Colors.red,
  });
}
