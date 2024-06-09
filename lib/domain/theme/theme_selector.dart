import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme.dart';

/// テーマ選択のProvider
final themeSelectorProvider =
    StateNotifierProvider<ThemeSelector, ThemeMode>((ref) {
  return ThemeSelector();
});

/// テーマの変更・記憶を行うStateNotifier
class ThemeSelector extends StateNotifier<ThemeMode> {
  ThemeSelector() : super(ThemeMode.light) {
    initialize();
  }

  /// SharedPreferences で使用するテーマ記憶用のキー
  static const themePrefsKey = 'selectedTheme';

  /// 選択されたテーマの記憶があれば取得して反映
  Future initialize() async {
    final themeIndex = await _themeIndex;
    state = ThemeMode.values.firstWhere(
      (e) => e.index == themeIndex,
      orElse: () => ThemeMode.system,
    );
  }

  ThemeData themeData() {
    if (state == ThemeMode.light) {
      return lightThemeData;
    } else {
      return darkThemeData;
    }
  }

  /// テーマの変更を行い、永続化
  Future change(ThemeMode theme) async {
    await _save(theme.index);
    state = theme;
  }

  /// 現在選択中のテーマを`SharedPreferences`から取得
  Future<int?> get _themeIndex async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(themePrefsKey);
  }

  /// 選択した`SharedPreferences`に保存
  Future<void> _save(int themeIndex) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(themePrefsKey, themeIndex);
  }
}
