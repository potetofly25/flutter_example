import 'package:flutter/material.dart';

// 要素（widget）の角を丸めたい時のユーティリティ
// https://zenn.dev/iput_app/articles/6a06efda4b58fd
// Container(
//  decoration: BoxDecoration(
//    borderRadius: BorderRadius.all(
//      Radius.circular(BorderRoundness.lg.value),
//    ),
//  ),
//);
enum BorderRoundness {
  none(radius: Radius.circular(0), value: 0),
  xs(radius: Radius.circular(4), value: 4),
  sm(radius: Radius.circular(8), value: 8),
  md(radius: Radius.circular(12), value: 12),
  lg(radius: Radius.circular(16), value: 16),
  xl(radius: Radius.circular(24), value: 24),
  full(radius: Radius.circular(9999), value: 9999),
  ;

  const BorderRoundness({
    required this.radius,
    required this.value,
  });

  final Radius radius;
  final double value;
}
