import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(router.location),
      ),
      body: Center(
        child: ElevatedButton(
            // context.go('/1')でも挙動は同じ
            onPressed: () => context.push('/1'),
            child: const Text('1画面に遷移')),
      ),
    );
  }
}
