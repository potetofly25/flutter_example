import 'package:flutter/material.dart';

/*
  onPressed: () {
    showConfirmDialog(
      context,
      title: 'タイトル',
      content: 'テキストテキストテキストテキストテキストテキストテキストテキスト',
      onApproved: () {
        Navigator.of(context).pop();
      },
    );
  },
*/

/// はい/いいえ が選択できるバージョン
Future showConfirmDialog(
  context, {
  required String title,
  required String content,
  required onApproved,
}) async {
  showDialog(
      context: context,
      // barrierDismissibleのbool値をtrueにすると、
      // ダイアログの外側を押した際にダイアログが出る前の画面に戻れるようになります。
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            // デバイスに応じて横幅(width)は調整してください。
            width: 311.0,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent, width: 3),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              // mainAxisSize: MainAxisSize.min があることで、
              // Columnの子要素の縦幅に合わせて表示できます。
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    content,
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        side: const BorderSide(
                          width: 1.0,
                          color: Colors.blueAccent,
                        ),
                        shadowColor: Colors.grey,
                        // elevation で影の長さを指定
                        elevation: 5,
                        // shape: const StadiumBorder() でボタンのサイドがまるくなります。
                        shape: const StadiumBorder(),
                      ),
                      onPressed: onApproved,
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                        child: Text('いいえ'),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        shadowColor: Colors.grey,
                        elevation: 5,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                        child: Text('はい'),
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
