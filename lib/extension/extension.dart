import 'dart:convert';

import 'package:flutter/material.dart';

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

enum Gender {
  female(1),
  male(2);

  final int value;

  const Gender(this.value);

  dynamic toJson() => value;
}

class Human {
  final int age;
  final Gender gender;

  Human({required this.age, required this.gender});

  toJson() {
    return {"age": age, "gender": gender};
  }
}

// void main() {
//   final me = Human(age: 37, gender: Gender.male);
//   final obj = json.encode(me);
//   print(obj); // -> {"age":37,"gender":2}
//   assert(obj == '{"age":37,"gender":2}');
// }

// - 練習 -
// Enhanced enumに動物名を定義し、AnimalクラスをJsonに変えるスクリプトを作成

// enumを定義
enum Name {
  dog('犬'),
  cat('猫'),
  rabbit('うさぎ');

  final String value;
  const Name(this.value);

  dynamic toJson() => value;
}

class Animals {
  final Name name;
  final int age;

  Animals(this.name, this.age);

  toJson() {
    return {
      'name': name.toJson(),
      'age': age,
    };
  }
}

class EnumTest {
  dynamic jsonAnimal = {};
  void enumTest() {
    final animal = Animals(Name.cat, 12).toJson();
    jsonAnimal = json.decode(animal);
    print(jsonAnimal);
  }
}
