import 'package:flutter/material.dart';

/// OK のみのバージョン
showAlertDialog(
  context, {
  required String title,
  required String content,
  onApproved,
}) async {
  late Color outlineColor = Colors.grey;
  late Color buttonBgColor = Colors.blueAccent;
  late Color buttonForeColor = Colors.white;

  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            width: 311.0,
            decoration: BoxDecoration(
              color: Theme.of(context).dialogTheme.backgroundColor,
              border: Border.all(color: outlineColor, width: 1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Text(
                      title,
                      style: Theme.of(context).dialogTheme.titleTextStyle,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    content,
                    style: Theme.of(context).dialogTheme.contentTextStyle,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      //style: Theme.of(context).elevatedButtonTheme.style,
                      /*
                      style: ElevatedButton.styleFrom(
                        foregroundColor:
                            Theme.of(context).buttonTheme.colorScheme?.surface,
                        backgroundColor: buttonBgColor,
                        shadowColor: Colors.grey,
                        elevation: 5,
                        shape: const StadiumBorder(),
                      ),
                      */
                      onPressed: () {
                        if (onApproved != null) {
                          onApproved();
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 36),
                        child: Text('OK'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
        );
      });
}
