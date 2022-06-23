import 'dart:math';

import 'package:flutter/material.dart';

class MyKeyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Widget> tiles;
  @override
  void initState() {
    super.initState();
    //2つのStatefulWidgetが準備
    tiles = [
      StatefulTile(),
      StatefulTile(),
    ];
  }

  // 入れ替え処理
  void changeTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: tiles,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeTiles,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class StatefulTile extends StatefulWidget {
  StatefulTile({Key? key}) : super(key: key);
  @override
  _StatefulTileState createState() => _StatefulTileState();
}

class _StatefulTileState extends State<StatefulTile> {
  Color _color = Colors.black;
  var _random = new Random();
  // initStateで色を設定する
  @override
  void initState() {
    super.initState();
    _color = Color.fromRGBO(
        _random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1);
  }

  // ビルド内では色は最初に作ったものを使う
  @override
  Widget build(BuildContext context) {
    print("build");
    return Container(
      color: _color,
      height: 100,
      width: 100,
    );
  }
}
