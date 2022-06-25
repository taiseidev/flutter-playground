import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/main.dart';
import 'package:get_it/get_it.dart';

class FirstSignInPage extends StatefulWidget {
  FirstSignInPage({Key? key}) : super(key: key);

  @override
  State<FirstSignInPage> createState() => _FirstSignInPageState();
}

class _FirstSignInPageState extends State<FirstSignInPage> {
  final count = GetIt.I<TestNotifier>();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      // 第一引数：繰り返す間隔の時間を設定
      const Duration(seconds: 1),
      // 第二引数：その間隔ごとに動作させたい処理を書く
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
            const Text('初回ログイン画面'),
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
