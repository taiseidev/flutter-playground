import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
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
  // センサーから値を取得する間隔
  static const _interval = 0.02;
  // 背景画像の拡大倍率
  static const _backGroundScale = 1.2;
  // foregroundの動きに合わせてどれだけ動くかの値
  static const _backgroundMoveOffsetScale = 0.6;
  static const _maxAngle = 120;
  // foregroundを上下左右にどれくらい動かせるかの値
  static const _maxForegroundMove = Offset(50, 50);
  // 初期位置
  static const _inititalForegroundOffset = Offset(400, 30);
  // 初期位置
  static const _inititalBackgroundOffset = Offset(0, 0);

  // ジャイロセンサーから取得した現在の位置
  Offset _foregroundOffset = _inititalForegroundOffset;
  // ジャイロセンサーから取得した現在の位置
  Offset _backgroundOffset = _inititalBackgroundOffset;
  // gyroscopeeventを購読するための定義
  late StreamSubscription<sensors.GyroscopeEvent> _streamGyrpscopeEvent;

  @override
  void initState() {
    super.initState();
    // gyroscpeEventsをリッスン。リッスンした際に_listenGyroscopeEventを発火するようにしている
    _streamGyrpscopeEvent =
        sensors.gyroscopeEvents.listen((_listenGyroscopeEvent));
  }

  @override
  void dispose() {
    super.dispose();
    // 不要になったらgyroscopeEventをdispose
    _streamGyrpscopeEvent.cancel();
  }

  void _listenGyroscopeEvent(sensors.GyroscopeEvent event) {
    // 軸 × 0.2 × 180 × 円周率
    // 度数法とは
    final angle = Offset(
      event.x * _interval * 180 / pi,
      event.y * _interval * 180 / pi,
    );
    print('X:${angle.dx}');
    print('Y:${angle.dy}');

    // もし取得したOffset情報が＿maxAngleより大きかった場合は処理から外れる。
    if (angle.dx >= _maxAngle || angle.dy >= _maxAngle) {
      return;
    }

    final addForegroundOffset = Offset(
      angle.dx / _maxAngle * _maxForegroundMove.dx,
      angle.dy / _maxAngle * _maxForegroundMove.dy,
    );

    final newForegroundOffse = _foregroundOffset + addForegroundOffset;
    // 動かしたあとの値が動かせる範囲の最大値である_maxForegroundMoveを超えていないか確認
    if (newForegroundOffse.dx >=
            _inititalForegroundOffset.dx + _maxForegroundMove.dx ||
        newForegroundOffse.dx <=
            _inititalForegroundOffset.dx - _maxForegroundMove.dx ||
        newForegroundOffse.dy >=
            _inititalForegroundOffset.dy + _maxForegroundMove.dy ||
        newForegroundOffse.dy <=
            _inititalForegroundOffset.dy - _maxForegroundMove.dy) {
      return;
    }

    setState(() {
      _foregroundOffset = _foregroundOffset + addForegroundOffset;
      _backgroundOffset =
          _backgroundOffset - addForegroundOffset * _backgroundMoveOffsetScale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: _backgroundOffset.dx,
              left: _backgroundOffset.dy,
              child: Image.asset(
                'assets/cat.jpeg',
                scale: 1.2,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              '3Dテスト',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Positioned(
              top: _foregroundOffset.dx,
              left: _foregroundOffset.dy,
              child: Lottie.network(
                'https://assets5.lottiefiles.com/packages/lf20_dwm2hi59.json',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
