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
              child: const Text('HotReloadã§ããð'),
            ),
          ],
        ),
      ),
    );
  }
}

// Dialogãç¬èªã®ã¦ã£ã¸ããã¨ãã¦åãåºã
// ããããªã­ã¼ãæã«onPressedåã¯åæç»ãããªãããhot reloadæã«ã¯dialogåã¯å¤æ´ãããªã
// ãããç¬èªã¦ã£ã¸ããã¨ãã¦åãåºããå ´åbuildã¡ã½ãããåæç»ãããããåãåºããdialogmã®åæç»ããã
class DemoDialog extends StatelessWidget {
  const DemoDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ãã®ã¡ã½ããã¯ rebuildæã«åå®è¡ãããã
    return const AlertDialog(
      content: Text('ããã®ãã­ã¹ã'),
    );
  }
}
