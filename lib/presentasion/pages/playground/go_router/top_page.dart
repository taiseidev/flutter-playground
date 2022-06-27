import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GoRouterサンプル'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/signIn'),
              child: const Text('ログイン'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/signUp'),
              child: const Text('会員登録'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        final prefs = GetIt.I<SharedPreferences>();
        prefs.remove('isFirst');
      }),
    );
  }
}
