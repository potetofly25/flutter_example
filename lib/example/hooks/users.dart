import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'mock_user_repository.dart';

class Users extends HookWidget {
  const Users({super.key});

  @override
  Widget build(BuildContext context) {
    getApiUsers() async {
      final usersApi = MockUserRepository();
      final res = await usersApi.fetchAll();
      return res;
    }

    // 値をキャッシュしておきたいものを定義。第2引数に値を入れると、検知するたびに再計算される。
    final getUsersFuture = useMemoized(getApiUsers, []);
    // useMemoizedで計算完了する前の初期値も設定可能
    final usersSnapshot = useFuture(getUsersFuture, initialData: []);

    return Container(
        child: usersSnapshot.data!.isNotEmpty
            ? Column(
                children: usersSnapshot.data!
                    .map((user) => Text(user.userName))
                    .toList())
            : const Text("ユーザーがいません"));
  }
}
