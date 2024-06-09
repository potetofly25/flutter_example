import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/widget/button/go_button.dart';

class NavbarHomePage extends StatelessWidget {
  const NavbarHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const GoButton(buttonTitle: '戻る', routePath: '/'),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              // Startページのネストしたルートのページ.
              // goRouter.push('detail', extra: "test");
              // GoRouter.of(context).push('detail');
              GoRouter.of(context)
                  .push('/navbar-home/navbar-detail', extra: "test");
            },
            child: const Text('詳細'),
          ),
        ],
      )),
    );
  }
}
