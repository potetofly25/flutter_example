import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'riverpod_state_page.dart';

class WidgetC extends StatelessWidget {
  const WidgetC({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      print('called WidgetC#build');
      final notifier = ref.read(riverpodStateHomePageProvider.notifier);
      return ElevatedButton(
          onPressed: () {
            notifier.increment();
          },
          child: const Icon(Icons.add));
    });
  }
}
