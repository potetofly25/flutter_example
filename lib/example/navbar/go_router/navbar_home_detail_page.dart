import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavbarHomeDetailPage extends StatelessWidget {
  const NavbarHomeDetailPage({super.key, required this.product});

  final String product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(product),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(Icons.close),
              ),
            )
          ],
        ),
      ),
    );
  }
}
