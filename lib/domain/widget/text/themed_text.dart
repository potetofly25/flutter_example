import 'package:flutter/material.dart';

import '../../exception/app_exception.dart';
import '../../theme/custom_colors.dart';

/// BuildContext に基づいたテーマを便利に取得して割り当て、Text Widget に割り当てて返すシンタックスシュガーよりのユーティリティ
///
/// - [TextTheme] の提供する各種 [TextStyle]
/// - [ColorScheme] の提供する各種 [Color]
/// - [CustomColor] の提供する各種 [Color]
///
/// (ex) ThemedText(context).displayLarge.success.build("Hello World!");
/// https://qiita.com/tokicat/items/bcd64a132897e42a0d82
class ThemedText {
  ThemedText(BuildContext context) : _context = context;

  final BuildContext _context;
  late final TextTheme _textTheme = Theme.of(_context).textTheme;
  late final ColorScheme _colorScheme = Theme.of(_context).colorScheme;
  late final CustomColors _customColors =
      Theme.of(_context).extension<CustomColors>()!;
  late TextStyle _textStyle = _textTheme.bodyMedium!;
  String? _fontFamily;
  double? _fontSize;
  Color? _color;
  FontWeight? _fontWeight;
  int? _maxLines;
  TextOverflow? _overflow;
  TextHeightBehavior? _textHeightBehavior;

  // Fonts
  ThemedText _setFontFamily(String fontFamily) {
    _fontFamily = fontFamily;
    return this;
  }

  ThemedText get notoSansJP => _setFontFamily("NotoSansJP");
  ThemedText get roboto => _setFontFamily("Roboto");

  // TextStyles

  ThemedText _setTextStyle(TextStyle? textStyle) {
    if (textStyle == null) {
      throw AppException.error("textStyle is null");
    }
    _textStyle = textStyle;
    return this;
  }

  ThemedText get displayLarge => _setTextStyle(_textTheme.displayLarge);
  ThemedText get displayMedium => _setTextStyle(_textTheme.displayMedium);
  ThemedText get displaySmall => _setTextStyle(_textTheme.displaySmall);
  ThemedText get headlineLarge => _setTextStyle(_textTheme.headlineLarge);
  ThemedText get headlineMedium => _setTextStyle(_textTheme.headlineMedium);
  ThemedText get headlineSmall => _setTextStyle(_textTheme.headlineSmall);
  ThemedText get titleLarge => _setTextStyle(_textTheme.titleLarge);
  ThemedText get titleMedium => _setTextStyle(_textTheme.titleMedium);
  ThemedText get titleSmall => _setTextStyle(_textTheme.titleSmall);
  ThemedText get bodyLarge => _setTextStyle(_textTheme.bodyLarge);
  ThemedText get bodyMedium => _setTextStyle(_textTheme.bodyMedium);
  ThemedText get bodySmall => _setTextStyle(_textTheme.bodySmall);
  ThemedText get labelLarge => _setTextStyle(_textTheme.labelLarge);
  ThemedText get labelMedium => _setTextStyle(_textTheme.labelMedium);
  ThemedText get labelSmall => _setTextStyle(_textTheme.labelSmall);

  // Colors

  ThemedText _setColor(Color? color) {
    if (color == null) {
      throw AppException.error("color is null");
    }
    _color = color;
    return this;
  }

  ThemedText get primary => _setColor(_colorScheme.primary);
  ThemedText get onPrimary => _setColor(_colorScheme.onPrimary);
  ThemedText get primaryContainer => _setColor(_colorScheme.primaryContainer);
  ThemedText get onPrimaryContainer =>
      _setColor(_colorScheme.onPrimaryContainer);
  ThemedText get secondaryContainer =>
      _setColor(_colorScheme.secondaryContainer);
  ThemedText get onSecondaryContainer =>
      _setColor(_colorScheme.onSecondaryContainer);
  ThemedText get tertiary => _setColor(_colorScheme.tertiary);
  ThemedText get onTertiary => _setColor(_colorScheme.onTertiary);
  ThemedText get tertiaryContainer => _setColor(_colorScheme.tertiaryContainer);
  ThemedText get onTertiaryContainer =>
      _setColor(_colorScheme.onTertiaryContainer);
  ThemedText get errorContainer => _setColor(_colorScheme.errorContainer);
  ThemedText get onErrorContainer => _setColor(_colorScheme.onErrorContainer);
  ThemedText get surfaceVariant =>
      _setColor(_colorScheme.surfaceContainerHighest);
  ThemedText get onSurfaceVariant => _setColor(_colorScheme.onSurfaceVariant);
  ThemedText get outline => _setColor(_colorScheme.outline);
  ThemedText get outlineVariant => _setColor(_colorScheme.outlineVariant);
  ThemedText get shadow => _setColor(_colorScheme.shadow);
  ThemedText get scrim => _setColor(_colorScheme.scrim);
  ThemedText get inverseSurface => _setColor(_colorScheme.inverseSurface);
  ThemedText get onInverseSurface => _setColor(_colorScheme.onInverseSurface);
  ThemedText get inversePrimary => _setColor(_colorScheme.inversePrimary);
  ThemedText get surfaceTint => _setColor(_colorScheme.surfaceTint);
  ThemedText get onSurface => _setColor(_colorScheme.onSurface);
  ThemedText get error => _setColor(_colorScheme.error);
  ThemedText get onError => _setColor(_colorScheme.onError);

  // CustomColors

  ThemedText get customSourceSuccess => _setColor(_customColors.sourceSuccess);
  ThemedText get customSuccess => _setColor(_customColors.success);
  ThemedText get customOnSuccess => _setColor(_customColors.onSuccess);
  ThemedText get customSuccessContainer =>
      _setColor(_customColors.successContainer);
  ThemedText get customOnSuccessContainer =>
      _setColor(_customColors.onSuccessContainer);
  ThemedText get customSourceInfo => _setColor(_customColors.sourceInfo);
  ThemedText get customInfo => _setColor(_customColors.info);
  ThemedText get customOnInfo => _setColor(_customColors.onInfo);
  ThemedText get customInfoContainer => _setColor(_customColors.infoContainer);
  ThemedText get customOnInfoContainer =>
      _setColor(_customColors.onInfoContainer);

  // Other Custom

  ThemedText fontSize(double fontSize) {
    _fontSize = fontSize;
    return this;
  }

  ThemedText fontWeight(FontWeight fontWeight) {
    _fontWeight = fontWeight;
    return this;
  }

  ThemedText get bold {
    _fontWeight = FontWeight.bold;
    return this;
  }

  ThemedText maxLines(int maxLines) {
    _maxLines = maxLines;
    return this;
  }

  ThemedText get overflowEllipsis {
    _overflow = TextOverflow.ellipsis;
    return this;
  }

  ThemedText textHeightBehavior(TextHeightBehavior textHeightBehavior) {
    _textHeightBehavior = textHeightBehavior;
    return this;
  }

  TextStyle get style => _textStyle.copyWith(
        color: _color,
        fontFamily: _fontFamily,
        fontSize: _fontSize,
        fontWeight: _fontWeight,
      );

  Text build(String text) {
    return Text(
      text,
      maxLines: _maxLines,
      overflow: _overflow,
      textHeightBehavior: _textHeightBehavior,
      style: style,
    );
  }
}
