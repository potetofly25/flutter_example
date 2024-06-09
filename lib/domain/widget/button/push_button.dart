import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PushButton extends StatelessWidget {
  const PushButton({
    super.key,
    required this.buttonTitle,
    this.action,
    this.routePath,
  });

  final String buttonTitle; // ボタンのタイトルを引数として渡す
  final String? routePath; // パスを文字として渡す
  final Function? action;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          if (action != null) action!();
          if (routePath != null) GoRouter.of(context).push(routePath!);
        },
        child: Text(buttonTitle));
  }
}
