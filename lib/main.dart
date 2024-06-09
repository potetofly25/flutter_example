import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_routing.dart';
import 'domain/behavior/custom_scroll_behavior.dart';
import 'domain/theme/theme.dart';
import 'domain/theme/theme_selector.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return _routerApp(ref);
  }

  Widget _routerApp(WidgetRef ref) {
    final themeMode = ref.watch(themeSelectorProvider);
    return MaterialApp.router(
      title: 'Sample App',
      routerConfig: appRouting,
      theme: themeMode == ThemeMode.dark ? darkThemeData : lightThemeData,
      darkTheme: themeMode == ThemeMode.light ? lightThemeData : darkThemeData,
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}
