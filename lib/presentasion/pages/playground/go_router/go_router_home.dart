import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            // context.go('/1')でも挙動は同じ
            onPressed: () => GoRouter.of(context).go('/1'),
            child: const Text('1画面に遷移')),
      ),
    );
  }
}
