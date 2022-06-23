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
      StatefulTile(
        key: UniqueKey(),
      ),
      StatefulTile(
        key: UniqueKey(),
      ),
    ];
  }

  // 入れ替え処理
  void changeTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }

// keyを指定していないとbuildそのものは行われているが、Widget-Element間の紐付けが更新されない。
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
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: ((context) => ListPage()))),
        child: const Icon(Icons.add),
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

// keyでスクロールした場所の状態を保持している
class ListPage extends StatefulWidget {
  final title = 'List Key Smaple';
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text('Tab-1'),
              ),
              Tab(
                child: Text('Tab-2'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // PageStorageKeyを指定しないと再描画されて元の位置に戻ってしまう
            //_TabPage(tab: 0),
            //_TabPage(tab: 1),
            // PageStorageKeyを利用してStateを保存するパターン
            _TabPage(key: const PageStorageKey(0), tab: 0),
            _TabPage(key: const PageStorageKey(1), tab: 1),
          ],
        ),
      ),
    );
  }
}

class _TabPage extends StatefulWidget {
  _TabPage({
    required Key key,
    required this.tab,
  }) : super(key: key);

  final int tab;

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<_TabPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('${widget.tab}: Item $index'),
        );
      },
    );
  }
}
