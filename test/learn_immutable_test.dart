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
}
