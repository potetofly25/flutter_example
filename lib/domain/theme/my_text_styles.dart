import 'package:flutter/material.dart';

import 'my_colors.dart';

/// Use as:
/// Text("Hello!", styles: MyTextStyles.title.large.white);
/// https://qiita.com/tokicat/items/124cb02193161f798e53
class MyTextStyles {
  MyTextStyles._();

  static const fontFamily = "Hiragino Sans";

  static _toStyle(double fontSize, double height, FontWeight fontWeight,
      double letterSpacing,
      {Color color = MyColors.black}) {
    return TextStyle(
      fontFamily: MyTextStyles.fontFamily,
      color: color,
      fontSize: fontSize,
      // baseline 設定がうまくいかず height 指定すると下寄りの文字になってしまうので、適用を保留
      // height: height / fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
    );
  }

  static final title = _MyTextStyleSet(
    large: _toStyle(22, 28, FontWeight.w400, 0),
    medium: _toStyle(16, 24, FontWeight.w500, 0.15),
    small: _toStyle(14, 20, FontWeight.w500, 0.1),
  );

  static final label = _MyTextStyleSet(
    large: _toStyle(14, 20, FontWeight.w500, 0.1),
    medium: _toStyle(12, 16, FontWeight.w500, 0.5),
    small: _toStyle(11, 16, FontWeight.w500, 0.5),
  );

  static final body = _MyTextStyleSet(
    large: _toStyle(16, 24, FontWeight.w400, 0.15),
    medium: _toStyle(14, 20, FontWeight.w400, 0.25),
    small: _toStyle(12, 16, FontWeight.w400, 0.4),
  );

  static final link = _MyTextStyleSet(
    large: _toStyle(16, 24, FontWeight.w400, 0.15, color: MyColors.textlink),
    medium: _toStyle(14, 20, FontWeight.w400, 0.25, color: MyColors.textlink),
    small: _toStyle(12, 16, FontWeight.w400, 0.4, color: MyColors.textlink),
  );
}

/// Wrapper for TextStyle
class _MyTextStyle extends TextStyle {
  _MyTextStyle(TextStyle style)
      : super(
          color: style.color,
          backgroundColor: style.backgroundColor,
          fontSize: style.fontSize,
          fontWeight: style.fontWeight,
          fontStyle: style.fontStyle,
          letterSpacing: style.letterSpacing,
          wordSpacing: style.wordSpacing,
          textBaseline: style.textBaseline,
          height: style.height,
          leadingDistribution: style.leadingDistribution,
          locale: style.locale,
          foreground: style.foreground,
          background: style.background,
          shadows: style.shadows,
          fontFeatures: style.fontFeatures,
          decoration: style.decoration,
          decorationColor: style.decorationColor,
          decorationStyle: style.decorationStyle,
          decorationThickness: style.decorationThickness,
          debugLabel: style.debugLabel,
          overflow: style.overflow,
        );

  _MyTextStyle get black => _MyTextStyle(copyWith(color: MyColors.black));
  _MyTextStyle get white => _MyTextStyle(copyWith(color: MyColors.white));
  _MyTextStyle get caution => _MyTextStyle(copyWith(color: MyColors.caution));

  _MyTextStyle get bold => _MyTextStyle(copyWith(fontWeight: FontWeight.w700));
}

class _MyTextStyleSet extends _MyTextStyle {
  final _MyTextStyle large;
  // medium is this
  final _MyTextStyle small;

  _MyTextStyleSet(
      {required TextStyle large,
      required TextStyle medium,
      required TextStyle small})
      : large = _MyTextStyle(large),
        small = _MyTextStyle(small),
        super(medium);
}
