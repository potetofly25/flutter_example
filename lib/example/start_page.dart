import 'package:flutter/material.dart';
import 'package:flutter_example/app_routing.dart';
import 'package:go_router/go_router.dart';

import '../domain/widget/button/go_button.dart';
import '../domain/widget/text/themed_text.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyHome Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ThemedText(context)
                .titleLarge
                .primary
                .overflowEllipsis
                .bold
                .notoSansJP
                .maxLines(2)
                .build("各ページへの遷移"),
            const SizedBox(height: 20),
            const GoButton(
              buttonTitle: 'Riverpodカウンタページ',
              routePath: '/rivercounter',
            ),
            const SizedBox(height: 10),
            const GoButton(
              buttonTitle: 'カウンタページ',
              routePath: '/counter',
            ),
            TextButton(
              onPressed: () {
                // Startページのネストしたルートのページ.
                GoRouter.of(context).go('/blank');
              },
              child: const Text('戻るボタン付きの遷移'),
            ),
            const SizedBox(height: 10),
            GoButton(
              buttonTitle: 'ナビページへの遷移',
              // routePath: '/home',
              action: () {
                appRouting.go("/navbar-home");
              },
            ),
            const SizedBox(height: 10),
            const GoButton(
              buttonTitle: 'Riverpod状態管理ページ',
              routePath: '/statemanagement',
            ),
            const SizedBox(height: 10),
            const GoButton(
              buttonTitle: 'ハンバーガーメニューページ',
              routePath: '/hanburger_menu',
            ),
            const SizedBox(height: 10),
            const GoButton(
              buttonTitle: 'ダイアログサンプルページ',
              routePath: '/dialog_sample',
            ),
            const SizedBox(height: 10),
            const GoButton(
              buttonTitle: 'WEBサンプルページ',
              routePath: '/web',
            ),
            const SizedBox(height: 10),
            const GoButton(
              buttonTitle: 'WindowsWEBサンプルページ',
              routePath: '/winweb',
            ),
          ],
        ),
      ),
    );
  }
}
