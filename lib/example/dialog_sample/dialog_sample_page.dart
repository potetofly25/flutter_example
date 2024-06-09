import 'package:flutter/material.dart';

import '../../domain/widget/button/go_button.dart';
import 'alert_dialog_button_widget.dart';
import 'alert_dialog_button_widget2.dart';
import 'blue_alert_dialog_button_widget.dart';
import 'blue_confirm_dialog_button_widget.dart';
import 'dropdown_dialog_button_widget.dart';
import 'text_field_dialog_button_widget.dart';
import 'text_field_dialog_button_widget2.dart';

// https://zenn.dev/mamoru_takami/articles/b76b734f2d7783
class DialogSamplePage extends StatelessWidget {
  const DialogSamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog sample'),
        actions: const [],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          GoButton(buttonTitle: '戻る', routePath: '/'),
          BlueConfirmDialogButtonWidget(),
          BlueAlertDialogButtonWidget(),
          AlertDialogButtonWidget(),
          AlertDialogButtonWidget2(),
          DropdownDialogButtonWidget(),
          TextFieldDialogButtonWidget(),
          TextFieldDialogButtonWidget2(),
        ],
      ),
    );
  }
}
