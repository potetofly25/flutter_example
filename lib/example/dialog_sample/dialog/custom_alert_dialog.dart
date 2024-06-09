import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
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
    if (cupertinoMode) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: contentWidget,
        actions: [
          if (cancelActionText != null)
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () {
                if (cancelAction != null) cancelAction!();
                Navigator.of(context).pop(false);
              },
              child: Text(cancelActionText!),
            ),
          CupertinoDialogAction(
            onPressed: () {
              if (action != null) action!();
              Navigator.of(context).pop(true);
            },
            child: Text(defaultActionText),
          ),
        ],
      );
    } else {
      return AlertDialog(
        title: Text(title),
        content: contentWidget,
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
              if (action != null) action!();
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    }
  }
}
