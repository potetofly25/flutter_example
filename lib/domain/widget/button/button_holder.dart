import 'package:flutter/material.dart';

/// ボタンを横に並べるホルダー
class ButtonHolder extends StatelessWidget {
  const ButtonHolder({
    super.key,
    required this.children,
  });

  /// ボタンたち
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // ボタンたちの間に　仕切りの線を入れる
    final childrenWithDividers = [];
    for (final child in children) {
      // ボタン
      childrenWithDividers.add(child);
      // 仕切り線
      childrenWithDividers.add(
        VerticalDivider(
          thickness: 1,
          width: 1,
          indent: 5,
          endIndent: 5,
          color: Theme.of(context).dividerColor,
        ),
      );
    }
    // 一番最後の仕切り線は除去
    childrenWithDividers.removeLast();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final child in childrenWithDividers) child,
        ],
      ),
    );
  }
}
