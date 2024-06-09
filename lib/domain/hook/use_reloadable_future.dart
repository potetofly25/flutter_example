import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// reload 可能な [AsyncSnapshot] を提供する [useFuture] のラッパー
///
/// 引数は [Future] を再生成可能な [getFuture] 関数となっている。
/// snapshot.reload() の実行によって [getFuture] が再実行される。
/// https://qiita.com/tokicat/items/e4a0f108cf233fe2dec0
ReloadableAsyncSnapshot<T> useReloadableFuture<T>(
  Future<T> Function() getFuture, {
  T? initialData,
  bool preserveState = true,
}) {
  final key = useState(1);
  final future = useMemoized(getFuture, [key.value]);
  final snapshot = useFuture(
    future,
    initialData: initialData,
    preserveState: preserveState,
  );
  final reloadable = ReloadableAsyncSnapshot(
    snapshot,
    reload: () => key.value += 1,
  );
  return reloadable;
}

/// [AsyncSnapshot] に対し、外部から実行可能な [reload] メソッドを加えるためだけのクラス
///
/// 外部で活用する想定はないため private でよい。
class ReloadableAsyncSnapshot<T> extends AsyncSnapshot<T?> {
  ReloadableAsyncSnapshot(
    AsyncSnapshot<T?> snapshot, {
    required this.reload,
  }) : super.withData(snapshot.connectionState, snapshot.data);

  final void Function() reload;
}

/*
活用サンプル
  Widget build(BuildContext context, WidgetRef ref) {
    // ⭐ future をお手軽に再評価可能な useFuture
    // Future<String> fetchArticle();
    final article = useReloadableFuture(() => fetchArticle());

    if (!article.hasData) {
      return CircularProgress();
    }

    return Column(
      children: [
        Text(article.data),
        ElevatedButton(
          child: const Text("Reload"),
          // ボタン押下により fetchArticle() が再実行される
          onPressed: () => article.reload(),
        ),
      ],
    );
  }
 */
