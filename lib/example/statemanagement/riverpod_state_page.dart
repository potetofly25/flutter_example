import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/widget/button/go_button.dart';
import 'widgets.dart';

class RiverpodStatePage extends StatelessWidget {
  const RiverpodStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Pattern')),
      body: const RiverpodStateHomePage(),
    );
  }
}

class RiverpodStateHomePage extends StatelessWidget {
  const RiverpodStateHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              WidgetA(),
              WidgetB(),
              WidgetC(),
              GoButton(buttonTitle: '戻る', routePath: '/'),
            ],
          ),
          LoadingWidget(),
        ],
      ),
    );
  }
}

@immutable
class RiverpodStateHomePageState {
  const RiverpodStateHomePageState({
    this.count = 0,
    this.isLoading = false,
  });

  final int count;
  final bool isLoading;

  RiverpodStateHomePageState copyWith({int? count, bool? isLoading}) {
    return RiverpodStateHomePageState(
        count: count ?? this.count, isLoading: isLoading ?? this.isLoading);
  }
}

class RiverpodStateHomePageStateNotifier
    extends StateNotifier<RiverpodStateHomePageState> {
  RiverpodStateHomePageStateNotifier()
      : super(const RiverpodStateHomePageState());

  void increment() {
    state = state.copyWith(isLoading: true);
    Future.delayed(const Duration(seconds: 1)).then((_) {
      state = state.copyWith(count: state.count + 1);
    }).whenComplete(() {
      state = state.copyWith(isLoading: false);
    });
  }
}

final riverpodStateHomePageProvider = StateNotifierProvider<
    RiverpodStateHomePageStateNotifier, RiverpodStateHomePageState>((ref) {
  return RiverpodStateHomePageStateNotifier();
});
