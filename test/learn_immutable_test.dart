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

  test('immutable const', () {
    final x1 = Immutable2(1);
    final x2 = Immutable2(1);
    expect(identical(x1, x2), isFalse);

    // constでインスタンスかしたときはコンパイル時に同一のインスタンスである事が保証されるため
    // 下記のようにx3とx4は同じとみなされる。
    // Widgetでconst SizedBoxを指定した場合は同じWidgetが再利用されるイメージ

    const x3 = Immutable2(1);
    const x4 = Immutable2(1);
    expect(identical(x3, x4), isTrue);
  });

  test('immutable freezed', () {
    var x1 = const Immutable3(1);
    final x2 = x1;
    // freezedを使うと、特定のフィールドを更新しつつ
    // それ以外のフィールドの値は維持された
    // 新しいオブジェクトとしてコピーするメソッドを自動生成してくれる
    x1 = x1.copyWith(value: x1.value + 1);
    expect(x1.value, 2);
    expect(x2.value, 1);
    expect(identical(x1, x2), isFalse);
  });

  test('freezed', () {
    var x1 = Immutable3(1);
    final x2 = x1;
    x1 = x1.copyWith(value: x1.value + 1);
    expect(x1.value, 2);
    expect(x2.value, 1);
    expect(x1 == x2, isFalse);
  });
}
