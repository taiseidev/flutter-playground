// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'learn_immutable.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Immutable3 {
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $Immutable3CopyWith<Immutable3> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Immutable3CopyWith<$Res> {
  factory $Immutable3CopyWith(
          Immutable3 value, $Res Function(Immutable3) then) =
      _$Immutable3CopyWithImpl<$Res>;
  $Res call({int value});
}

/// @nodoc
class _$Immutable3CopyWithImpl<$Res> implements $Immutable3CopyWith<$Res> {
  _$Immutable3CopyWithImpl(this._value, this._then);

  final Immutable3 _value;
  // ignore: unused_field
  final $Res Function(Immutable3) _then;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      value: value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_Immutable3CopyWith<$Res>
    implements $Immutable3CopyWith<$Res> {
  factory _$$_Immutable3CopyWith(
          _$_Immutable3 value, $Res Function(_$_Immutable3) then) =
      __$$_Immutable3CopyWithImpl<$Res>;
  @override
  $Res call({int value});
}

/// @nodoc
class __$$_Immutable3CopyWithImpl<$Res> extends _$Immutable3CopyWithImpl<$Res>
    implements _$$_Immutable3CopyWith<$Res> {
  __$$_Immutable3CopyWithImpl(
      _$_Immutable3 _value, $Res Function(_$_Immutable3) _then)
      : super(_value, (v) => _then(v as _$_Immutable3));

  @override
  _$_Immutable3 get _value => super._value as _$_Immutable3;

  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$_Immutable3(
      value == freezed
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Immutable3 with DiagnosticableTreeMixin implements _Immutable3 {
  const _$_Immutable3(this.value);

  @override
  final int value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Immutable3(value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Immutable3'))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Immutable3 &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  _$$_Immutable3CopyWith<_$_Immutable3> get copyWith =>
      __$$_Immutable3CopyWithImpl<_$_Immutable3>(this, _$identity);
}

abstract class _Immutable3 implements Immutable3 {
  const factory _Immutable3(final int value) = _$_Immutable3;

  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_Immutable3CopyWith<_$_Immutable3> get copyWith =>
      throw _privateConstructorUsedError;
}
