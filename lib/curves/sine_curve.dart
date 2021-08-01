import 'dart:math';

import 'package:flutter/material.dart';

class SineCurve extends Curve {
  final double count;

  SineCurve({this.count = 3});

  @override
  double transformInternal(double t) {
    var val = sin(count * 2 * pi * t) * 0.5 + 0.5;
    return val;
  }
}
