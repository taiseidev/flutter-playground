import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'learn_immutable.freezed.dart';

@freezed
class Immutable3 with _$Immutable3 {
  const factory Immutable3(int value) = _Immutable3;
}

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
