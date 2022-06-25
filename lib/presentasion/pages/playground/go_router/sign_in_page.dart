import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(router.location),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TextFormField(),
            // TextFormField(),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: Text('ログイン'),
            ),
          ],
        ),
      ),
    );
  }
}
