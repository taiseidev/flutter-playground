import 'package:flutter_playground/immutable/learn_immutable.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('mutable', () {
    final x1 = Mutable(1);
    final x2 = x1;
    x1.value++;
    expect(x1.value, 2);
    // x2とx1の参照先は同一なのでx1のvalueが変更されるとm2も変更される
    expect(x2.value, 2);
    expect(x1 == x2, isTrue);
    expect(identical(x1, x2), isTrue);
  });

  test('immutable', () {
    var x1 = Immutable(1);
    final x2 = x1;
    // 後から変更不可能(=immutable)
    // x1.value++;
// immutableなオブジェクトは変更操作ができず
    // 違う値を持たせたい場合は再生成が必要
    x1 = Immutable(x1.value + 1);
    expect(x1.value, 2);
    // x1を変更したわけではなく再生成したのでx2のvalueは元のまま
    expect(x2.value, 1);
    // 参照も違う
    expect(identical(x1, x2), isFalse);
  });
}
