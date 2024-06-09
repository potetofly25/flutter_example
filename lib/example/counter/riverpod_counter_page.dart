import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/widget/button/go_button.dart';
import 'counter_notifier.dart';

final countProvider = StateNotifierProvider<CounterNotifier, int>((ref) {
  return CounterNotifier();
});

class RiverPodCounterPage extends ConsumerStatefulWidget {
  const RiverPodCounterPage({super.key});

  @override
  ConsumerState<RiverPodCounterPage> createState() =>
      _RiverPodCounterPageState();
}

class _RiverPodCounterPageState extends ConsumerState<RiverPodCounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('カウント'), // Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('カウント画面', style: TextStyle(fontSize: 32.0)),
            const GoButton(buttonTitle: '戻る', routePath: '/'),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              ref.watch(countProvider).toString(), //'$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final counterNotifier = ref.read(countProvider.notifier);
          counterNotifier.increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
