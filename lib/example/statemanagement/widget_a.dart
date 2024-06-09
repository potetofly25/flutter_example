import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'riverpod_state_page.dart';

class WidgetA extends StatelessWidget {
  const WidgetA({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      print('called WidgetA#build');
      final count = ref.watch(riverpodStateHomePageProvider.select((state) {
        return state.count;
      }));
      return Center(
        child: Text(
          '$count',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      );
    });
  }
}
