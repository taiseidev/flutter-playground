import 'package:flutter/material.dart';
import 'package:flutter_playground/presentasion/pages/FlutterReverseDictionary/want_to_do_hot_reload_in_dialog.dart';

class ProcessWhenComeBackFromAPop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async => await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WantToDoHotReloadInDialog(),
                ),
              ).then((value) {
                print(value);
              }),
              child: Text('await pop'),
            ),
          ],
        ),
      ),
    );
  }
}
