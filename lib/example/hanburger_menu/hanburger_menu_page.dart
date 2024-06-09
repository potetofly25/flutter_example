import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HamburgerMenuPage extends ConsumerStatefulWidget {
  const HamburgerMenuPage({super.key});

  @override
  ConsumerState<HamburgerMenuPage> createState() => _HamburgerMenuPageState();
}

class _HamburgerMenuPageState extends ConsumerState<HamburgerMenuPage> {
  final menuList = ['Top', 'UserData', 'Access', 'Setting'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              GoRouter.of(context).go("/");
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'DrawerHeader',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 1.0,
              color: Colors.black,
            ),
            ...menuList.map(
              (e) => listTile(e),
            )
          ],
        ),
      ),
      body: Container(),
    );
  }
}

Widget listTile(String title) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_circle_right),
            )
          ],
        ),
      ),
      const Divider(
        thickness: 1.0,
        color: Colors.black,
      ),
    ],
  );
}
