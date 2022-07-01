import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:blobs/blobs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UiSmaple(),
    );
  }
}

class UiSmaple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      child: Stack(
        children: [
          Blob.fromID(
            id: ['12-5-36'],
            size: 400,
          ),
          // SvgPicture.asset(
          //   'assets/test.svg',
          // ),
        ],
      ),
    ));
  }
}
