import 'package:flutter/material.dart';
import 'package:webview_windows/webview_windows.dart';

import '../../domain/widget/button/go_button.dart';

class WebviewWindowsSample extends StatefulWidget {
  const WebviewWindowsSample({super.key});

  @override
  State<WebviewWindowsSample> createState() => _WebviewWindowsSampleState();
}

class _WebviewWindowsSampleState extends State<WebviewWindowsSample> {
  final _webviewController = WebviewController();
  final _urlController = TextEditingController();

  // true => 前のページが存在する（戻れる）
  // false => 前のページが存在しない（戻れない）
  var _canGoBack = false;

  @override
  void initState() {
    super.initState();
    _initWebView();
  }

  @override
  void dispose() {
    _webviewController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // controllerの初期化処理が完了するまで、インジケーターを表示する
      body: _webviewController.value.isInitialized
          ? Column(
              children: [
                const GoButton(buttonTitle: '戻る', routePath: '/'),
                _addressBar,
                Expanded(child: Webview(_webviewController)),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  // アドレスバーの実装
  Widget get _addressBar => Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          // contorllerで現在表示中のWebページのURLを表示する
          controller: _urlController,
          decoration: InputDecoration(
            icon: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: IconButton(
                // 前のページに戻れる・戻れないことによって、戻るボタンを有効・無効にする
                onPressed: _canGoBack ? _webviewController.goBack : null,
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            border: InputBorder.none,
          ),
          // Enterキーを押すと、今入力しているURLを読み込む
          onSubmitted: _webviewController.loadUrl,
        ),
      );

  Future<void> _initWebView() async {
    await _webviewController.initialize();

    await Future.wait([
      _webviewController.setBackgroundColor(Colors.white),
      _webviewController.setPopupWindowPolicy(WebviewPopupWindowPolicy.deny),
    ]);

    // URLと閲覧履歴の変更を検知するためのリスナーを追加する
    _webviewController.url.listen((url) => _urlController.text = url);
    _webviewController.historyChanged.listen(
      (event) => setState(() => _canGoBack = event.canGoBack),
    );

    await _webviewController.loadUrl('https://zenn.dev/topics/flutter');

    if (context.mounted) {
      setState(() {});
    }
  }
}
