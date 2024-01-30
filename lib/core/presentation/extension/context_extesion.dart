import 'package:flutter/material.dart';

extension BuildContextX on BuildContext {
  double get screenWidth =>
      (MediaQuery.of(this).size.width * 10).floorToDouble() / 10;

  double get screenHeight => MediaQuery.of(this).size.height;

  double calculateItemSize(
      {required double numberOfItems,
      required double padding,
      required double spacing}) {
    return (screenWidth - padding * 2 - spacing * (numberOfItems - 1)) /
        numberOfItems;
  }
}
