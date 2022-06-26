import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart' as sensors;

// ジャイロセンサーで3D効果を与える
// 考え方（3つのレイヤーに分ける）
// 背面→画像
// 中間→テキスト
// 前面→画像
// ジャイロセンサーで背面と前面を逆方向に移動させる。

class GyrosensorHome extends StatefulWidget {
  const GyrosensorHome({Key? key}) : super(key: key);

  @override
  State<GyrosensorHome> createState() => _GyrosensorHomeState();
}

class _GyrosensorHomeState extends State<GyrosensorHome> {
  @override
  void initState() {
    super.initState();
    sensors.gyroscopeEvents.listen(
      (data) {
        print(data.x);
        print(data.y);
        print(data.z);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
