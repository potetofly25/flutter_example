import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/theme/theme_selector.dart';
import 'dialog/custom_alert_dialog.dart';

class AlertDialogButtonWidget2 extends ConsumerWidget {
  const AlertDialogButtonWidget2({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      child: const Text('テーマ切り替え'),
      onPressed: () => showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
          title: 'テーマ切り替え',
          contentWidget: const Text('テーマ切り替えです.'),
          cancelActionText: 'Cancel',
          cancelAction: () {},
          defaultActionText: 'OK',
          action: () async {
            // TODO: implement method
            final currentThemeMode = ref.watch(themeSelectorProvider);
            final themeSelector = ref.watch(themeSelectorProvider.notifier);
            if (currentThemeMode == ThemeMode.dark) {
              await themeSelector.change(ThemeMode.light);
            } else {
              await themeSelector.change(ThemeMode.dark);
            }
          },
          cupertinoMode: true,
        ),
      ),
    );
  }
}
