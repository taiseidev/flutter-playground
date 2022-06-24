import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouter1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(router.location),
      ),
      body: Center(
        child: Text('1画面です'),
      ),
    );
  }
}
