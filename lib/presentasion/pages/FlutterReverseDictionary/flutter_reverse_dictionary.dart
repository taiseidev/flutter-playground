import 'package:flutter/material.dart';
import 'package:flutter_playground/presentasion/pages/FlutterReverseDictionary/process_when_copme_back_from_a_pop.dart';
import 'package:flutter_playground/presentasion/pages/FlutterReverseDictionary/want_to_do_hot_reload_in_dialog.dart';

class FlutterReverseDictionary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterReverseDictionary'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WantToDoHotReloadInDialog(),
                ),
              ),
              child: const Text('want to do hot reload in dialog'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProcessWhenComeBackFromAPop(),
                ),
              ),
              child: const Text('process when come back from a pop'),
            ),
          ],
        ),
      ),
    );
  }
}
