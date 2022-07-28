import 'package:flutter/foundation.dart';

class Mutable {
  Mutable(this.value);
  int value;
}

class Immutable {
  Immutable(this.value);
  final int value;
}

// @immutableアノテーション付ける
@immutable
class Immutable2 {
  // 全てのフィールドがfinalだと生成後に不変であることが保証されるのでconstにできる。
  // (@immutableにより、constを付けないと警告がでて指定漏れを教えてくれる)
  const Immutable2(this.value);
  // finalが欠けるとimmutableとして成り立たないのでコンパイルエラー
  final int value;
}
