import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'riverpod_state_page.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      print('called LoadingWidget#build');
      final isLoading = ref.watch(riverpodStateHomePageProvider.select((state) {
        return state.isLoading;
      }));
      return isLoading
          ? const DecoratedBox(
              decoration: BoxDecoration(color: Color(0x44000000)),
              child: Center(child: CircularProgressIndicator()))
          : const SizedBox.shrink();
    });
  }
}
