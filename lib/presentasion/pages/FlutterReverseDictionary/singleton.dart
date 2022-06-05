import 'package:flutter/material.dart';

// シングルトンにした場合インスタンスは一つしか生成できない
// 内部的なvalueという状態を1ずつ増やすだけのCounterクラス（Singletonバージョン）
class Counter {
  // ._() でプライベートコンストラクタが作れる
  // このファイル以外ではCounterのインスタンスを生成することができなくなった。
  Counter._();

  // 内部的にただひとつだけのインスタンスを static な変数として持たせる
  // これでこのプログラムではこのクラスのインスタンスがただひとつであることが保証される
  static final instance = Counter._();

  var value = 0;

  int increment() {
    return value++;
  }
}

class Singleton extends StatefulWidget {
  @override
  State<Singleton> createState() => _SingletonState();
}

class _SingletonState extends State<Singleton> {
  @override
  void initState() {
    super.initState();
    final counter0 = Counter.instance;
    final counter1 = Counter.instance;
    final counter2 = Counter.instance;

    print(counter0.increment());
    print(counter0.increment());
    print(counter1.increment());
    print(counter2.increment());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
