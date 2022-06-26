import 'package:flutter/material.dart';
import 'package:flutter_playground/presentasion/pages/FlutterReverseDictionary/flutter_reverse_dictionary.dart';
import 'package:flutter_playground/presentasion/pages/playground/go_router/main.dart';
import 'package:flutter_playground/presentasion/pages/playground/learning_key.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'presentasion/pages/gyrosensor/gyrosensor_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I
    ..registerSingleton(Count(5))
    ..registerSingleton(await SharedPreferences.getInstance());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter PlayGround'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FlutterReverseDictionary(),
                ),
              ),
              child: const Text('Flutter Reverse Dictionary'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FlutterReverseDictionary(),
                ),
              ),
              child: const Text('Hero'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyKeyApp(),
                ),
              ),
              child: const Text('key'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GoRouterSample(),
                ),
              ),
              child: const Text('Go_router'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GyrosensorHome(),
                ),
              ),
              child: const Text('GyroSensor'),
            ),
          ],
        ),
      ),
    );
  }
}
