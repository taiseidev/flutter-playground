import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/main.dart';
import 'package:get_it/get_it.dart';

class FirstSignInPage extends StatefulWidget {
  const FirstSignInPage({Key? key}) : super(key: key);

  @override
  State<FirstSignInPage> createState() => _FirstSignInPageState();
}

class _FirstSignInPageState extends State<FirstSignInPage> {
  final count = GetIt.I<Count>();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        count.countDown();
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('初回ログイン'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Text(
                    count.value.toString(),
                  ),
                ),
                const Text('秒後にホーム画面に遷移します。'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
