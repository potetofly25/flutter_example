import 'package:flutter/material.dart';

import 'dialog/custom_alert_dialog.dart';

class AlertDialogButtonWidget extends StatelessWidget {
  const AlertDialogButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('基本のAlertダイアログボタン'),
      onPressed: () => showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
          title: '基本のAlertダイアログ',
          contentWidget: const Text('This is an alert dialog.'),
          cancelActionText: 'Cancel',
          cancelAction: () {},
          defaultActionText: 'OK',
          action: () {
            // TODO: implement method
          },
        ),
      ),
    );
  }
}
