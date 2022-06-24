import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoRouter1 extends StatelessWidget {
  Future<bool> abandonNewPerson(BuildContext context) async {
    final bool result = await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("タイトル"),
          content: Text("メッセージメッセージメッセージメッセージメッセージメッセージ"),
          actions: <Widget>[
            // ボタン領域
            ElevatedButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context, false),
            ),
            ElevatedButton(
              child: Text("OK"),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        );
      },
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(router.location),
      ),
      body: Center(
        child: TextButton(
          onPressed: () async {
            // onWillPopと同様にpopする前に指定した関数を発火
            if (await abandonNewPerson(context)) context.pop();
          },
          child: Text('1画面です'),
        ),
      ),
    );
  }
}
