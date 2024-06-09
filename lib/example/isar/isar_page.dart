import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/widget/button/go_button.dart';
import 'user.dart';

class IsarPage extends ConsumerStatefulWidget {
  const IsarPage({super.key});

  @override
  ConsumerState<IsarPage> createState() => _IsarPageState();
}

class _IsarPageState extends ConsumerState<IsarPage> {
  late Isar database;
  List<User> customers = [];

  //Open database
  Future<Isar> openDatabase() async {
    final dir = await getApplicationDocumentsDirectory();
    return await Isar.open(
      [UserSchema],
      directory: dir.path,
    );
  }

  // Add new User in database
  Future<void> saveUser(User newUser) async {
    await database.writeTxn(() {
      return database.users.put(newUser); // 挿入と更新
    });
    debugPrint('done saveUser');
  }

  Future<void> deleteUser(User existingUser) async {
    await database.writeTxn(() async {
      await database.users.delete(existingUser.id); // 削除
    });
  }

  //Retrieve all users from the database.
  Future<void> getAllUser() async {
    List<User> users = await database.users.where().findAll();
    setState(() {
      customers = users;
    });
    debugPrint('done getAllUser');
  }

  @override
  void initState() {
    openDatabase().then((value) => database = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('データベース'), // Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('データベース画面', style: TextStyle(fontSize: 32.0)),
            const GoButton(buttonTitle: '戻る', routePath: '/'),
            ElevatedButton(
              child: const Text("ランキング"),
              onPressed: () {
                context.push('/ranking_list', extra: "引数です");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newUser = User()
            ..name = 'Jane Doe'
            ..age = 36;
          await saveUser(newUser);
          await getAllUser();
          for (final item in customers) {
            debugPrint('登録User ${item.name}');
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
