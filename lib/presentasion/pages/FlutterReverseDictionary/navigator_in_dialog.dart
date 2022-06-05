import 'package:flutter/material.dart';

class NavigatorInDialog extends StatefulWidget {
  const NavigatorInDialog({Key? key}) : super(key: key);

  @override
  State<NavigatorInDialog> createState() => _SamplePageState();
}

class _SamplePageState extends State<NavigatorInDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const CustomDialog();
              },
            );
          },
          child: const Text('ダイアログ'),
        ),
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.all(32),
      // content部分をNavigatorでラップすることによって
      // ダイアログ上で画面遷移することができる。
      content: Navigator(
        onGenerateRoute: (_) {
          return MaterialPageRoute(
            builder: ((context) => SizedBox(
                  width: 400,
                  child: Scaffold(
                    appBar: AppBar(
                      centerTitle: true,
                      title: const Text('1'),
                    ),
                    body: Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const NextDialog();
                              },
                            ),
                          );
                        },
                        child: const Text('2のページに進む'),
                      ),
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}

class NextDialog extends StatelessWidget {
  const NextDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('2'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('1のページに戻る'),
          ),
        ),
      ),
    );
  }
}
