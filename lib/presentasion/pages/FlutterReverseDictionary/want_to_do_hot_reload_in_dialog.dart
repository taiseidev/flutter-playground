import 'package:flutter/material.dart';

class WantToDoHotReloadInDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const DemoDialog();
                  },
                );
              },
              child: const Text('HotReloadできる😄'),
            ),
          ],
        ),
      ),
    );
  }
}

// Dialogを独自のウィジットとして切り出す
// ホットリロード時にonPressed内は再描画されないためhot reload時にはdialog内は変更されない
// しかし独自ウィジットとして切り出した場合buildメソッドが再描画されるため切り出したdialogmの再描画される
class DemoDialog extends StatelessWidget {
  const DemoDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // このメソッドは rebuild時に再実行される。
    return const AlertDialog(
      content: Text('ここのテキスト'),
    );
  }
}
