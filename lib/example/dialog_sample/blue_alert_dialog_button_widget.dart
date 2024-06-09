import 'package:flutter/material.dart';

import 'dialog/show_alert_dialog.dart';

class BlueAlertDialogButtonWidget extends StatelessWidget {
  const BlueAlertDialogButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('BLUE 基本のAlertダイアログボタン2'),
      onPressed: () => showAlertDialog(
        context,
        title: 'タイトル',
        content: 'テキストテキストテキストテキストテキストテキストテキストテキスト',
        onApproved: () {
          // はい が押された時の処理を入れる。

          // 元の画面に戻ります。
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
