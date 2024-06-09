import 'package:flutter/material.dart';

import 'dialog/show_confirm_dialog.dart';

class BlueConfirmDialogButtonWidget extends StatelessWidget {
  const BlueConfirmDialogButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('BLUE 基本のAlertダイアログボタン'),
      onPressed: () => showConfirmDialog(
        context,
        title: 'タイトル',
        content: 'テキストテキストテキストテキストテキストテキストテキストテキスト',
        onApproved: () {
          // はい が押された時の処理を入れる。
          // 以下は例
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
