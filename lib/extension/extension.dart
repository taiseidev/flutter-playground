import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ExtensionSample(),
    );
  }
}

// 文字列型を数字型に変換するextension
extension ToIntEx on String {
  int get toInt => int.parse(this);
}

class ExtensionSample extends StatelessWidget {
  String sampleString = '1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${sampleString.toInt}'),
      ),
    );
  }
}

extension ContextEx on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorTheme => Theme.of(this).colorScheme;

  Size get screenSize => MediaQuery.of(this).size;

  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnack(
      SnackBar snackBar) {
    return ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }
}
