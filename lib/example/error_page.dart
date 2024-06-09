import 'package:flutter/material.dart';

import '../domain/widget/button/go_button.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, this.message = ''});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('エラー'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('エラーが発生しました'),
            const SizedBox(height: 8),
            Text(message),
            const GoButton(buttonTitle: '戻る', routePath: '/'),
          ],
        ),
      ),
    );
  }
}
