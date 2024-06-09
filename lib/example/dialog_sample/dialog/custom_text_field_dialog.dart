// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFieldDialog extends StatelessWidget {
  const CustomTextFieldDialog({
    super.key,
    required this.title,
    required this.contentWidget,
    this.cancelActionText,
    this.cancelAction,
    required this.defaultActionText,
    this.action,
    this.cupertinoMode = false,
  });

  final String title;
  final Widget contentWidget;
  final String? cancelActionText;
  final Function? cancelAction;
  final String defaultActionText;
  final Function? action;
  final bool cupertinoMode;

  @override
  Widget build(BuildContext context) {
    const key = GlobalObjectKey<FormState>('FORM_KEY');

    //if (kIsWeb || Platform.isAndroid) {
    if (cupertinoMode) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Form(
          key: key,
          child: contentWidget,
        ),
        actions: [
          if (cancelActionText != null)
            CupertinoDialogAction(
              child: Text(cancelActionText!),
              onPressed: () {
                if (cancelAction != null) cancelAction!();
                Navigator.of(context).pop(false);
              },
            ),
          CupertinoDialogAction(
            child: Text(defaultActionText),
            onPressed: () {
              if (key.currentState!.validate()) {
                print('Validate OK');
                if (action != null) action!();
                Navigator.of(context).pop(true);
              } else {
                print('Validate NG');
              }
            },
          ),
        ],
      );
    } else {
      return AlertDialog(
        title: Text(title),
        content: Form(
          key: key,
          child: contentWidget,
        ),
        actions: [
          if (cancelActionText != null)
            TextButton(
              child: Text(cancelActionText!),
              onPressed: () {
                if (cancelAction != null) cancelAction!();
                Navigator.of(context).pop(false);
              },
            ),
          TextButton(
            child: Text(defaultActionText),
            onPressed: () {
              if (key.currentState!.validate()) {
                print('Validate OK');
                if (action != null) action!();
                Navigator.of(context).pop(true);
              } else {
                print('Validate NG');
              }
            },
          ),
        ],
      );
    }
  }
}
