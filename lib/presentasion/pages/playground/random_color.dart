import 'package:flutter/material.dart';
import 'Dart:math';

void main() {
  runApp(MyApp());
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
      home: RandomColor(),
    );
  }
}

class RandomColor extends StatefulWidget {
  @override
  State<RandomColor> createState() => _RandomColorState();
}

class _RandomColorState extends State<RandomColor> {
  var randomColor = const Color(0xffffffff);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'Random',
          style: TextStyle(
            color: randomColor,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            randomColor = Color(
              (Random().nextDouble() * 0xFFFFFF).toInt() << 0,
            ).withOpacity(1.0);
          });
        },
      ),
    );
  }
}
