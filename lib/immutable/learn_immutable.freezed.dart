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

/// @nodoc
mixin _$ParentCompany {
  ChildCompany? get childCompany => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ParentCompanyCopyWith<ParentCompany> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentCompanyCopyWith<$Res> {
  factory $ParentCompanyCopyWith(
          ParentCompany value, $Res Function(ParentCompany) then) =
      _$ParentCompanyCopyWithImpl<$Res>;
  $Res call({ChildCompany? childCompany});

  $ChildCompanyCopyWith<$Res>? get childCompany;
}

/// @nodoc
class _$ParentCompanyCopyWithImpl<$Res>
    implements $ParentCompanyCopyWith<$Res> {
  _$ParentCompanyCopyWithImpl(this._value, this._then);

  final ParentCompany _value;
  // ignore: unused_field
  final $Res Function(ParentCompany) _then;

  @override
  $Res call({
    Object? childCompany = freezed,
  }) {
    return _then(_value.copyWith(
      childCompany: childCompany == freezed
          ? _value.childCompany
          : childCompany // ignore: cast_nullable_to_non_nullable
              as ChildCompany?,
    ));
  }

  @override
  $ChildCompanyCopyWith<$Res>? get childCompany {
    if (_value.childCompany == null) {
      return null;
    }

    return $ChildCompanyCopyWith<$Res>(_value.childCompany!, (value) {
      return _then(_value.copyWith(childCompany: value));
    });
  }
}

/// @nodoc
abstract class _$$_ParentCompanyCopyWith<$Res>
    implements $ParentCompanyCopyWith<$Res> {
  factory _$$_ParentCompanyCopyWith(
          _$_ParentCompany value, $Res Function(_$_ParentCompany) then) =
      __$$_ParentCompanyCopyWithImpl<$Res>;
  @override
  $Res call({ChildCompany? childCompany});

  @override
  $ChildCompanyCopyWith<$Res>? get childCompany;
}

/// @nodoc
class __$$_ParentCompanyCopyWithImpl<$Res>
    extends _$ParentCompanyCopyWithImpl<$Res>
    implements _$$_ParentCompanyCopyWith<$Res> {
  __$$_ParentCompanyCopyWithImpl(
      _$_ParentCompany _value, $Res Function(_$_ParentCompany) _then)
      : super(_value, (v) => _then(v as _$_ParentCompany));

  @override
  _$_ParentCompany get _value => super._value as _$_ParentCompany;

  @override
  $Res call({
    Object? childCompany = freezed,
  }) {
    return _then(_$_ParentCompany(
      childCompany: childCompany == freezed
          ? _value.childCompany
          : childCompany // ignore: cast_nullable_to_non_nullable
              as ChildCompany?,
    ));
  }
}

/// @nodoc

class _$_ParentCompany with DiagnosticableTreeMixin implements _ParentCompany {
  _$_ParentCompany({this.childCompany});

  @override
  final ChildCompany? childCompany;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ParentCompany(childCompany: $childCompany)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ParentCompany'))
      ..add(DiagnosticsProperty('childCompany', childCompany));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ParentCompany &&
            const DeepCollectionEquality()
                .equals(other.childCompany, childCompany));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(childCompany));

  @JsonKey(ignore: true)
  @override
  _$$_ParentCompanyCopyWith<_$_ParentCompany> get copyWith =>
      __$$_ParentCompanyCopyWithImpl<_$_ParentCompany>(this, _$identity);
}

abstract class _ParentCompany implements ParentCompany {
  factory _ParentCompany({final ChildCompany? childCompany}) = _$_ParentCompany;

  @override
  ChildCompany? get childCompany;
  @override
  @JsonKey(ignore: true)
  _$$_ParentCompanyCopyWith<_$_ParentCompany> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChildCompany {
  Subcontractor? get subcontractor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChildCompanyCopyWith<ChildCompany> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChildCompanyCopyWith<$Res> {
  factory $ChildCompanyCopyWith(
          ChildCompany value, $Res Function(ChildCompany) then) =
      _$ChildCompanyCopyWithImpl<$Res>;
  $Res call({Subcontractor? subcontractor});

  $SubcontractorCopyWith<$Res>? get subcontractor;
}

/// @nodoc
class _$ChildCompanyCopyWithImpl<$Res> implements $ChildCompanyCopyWith<$Res> {
  _$ChildCompanyCopyWithImpl(this._value, this._then);

  final ChildCompany _value;
  // ignore: unused_field
  final $Res Function(ChildCompany) _then;

  @override
  $Res call({
    Object? subcontractor = freezed,
  }) {
    return _then(_value.copyWith(
      subcontractor: subcontractor == freezed
          ? _value.subcontractor
          : subcontractor // ignore: cast_nullable_to_non_nullable
              as Subcontractor?,
    ));
  }

  @override
  $SubcontractorCopyWith<$Res>? get subcontractor {
    if (_value.subcontractor == null) {
      return null;
    }

    return $SubcontractorCopyWith<$Res>(_value.subcontractor!, (value) {
      return _then(_value.copyWith(subcontractor: value));
    });
  }
}

/// @nodoc
abstract class _$$_ChildCompanyCopyWith<$Res>
    implements $ChildCompanyCopyWith<$Res> {
  factory _$$_ChildCompanyCopyWith(
          _$_ChildCompany value, $Res Function(_$_ChildCompany) then) =
      __$$_ChildCompanyCopyWithImpl<$Res>;
  @override
  $Res call({Subcontractor? subcontractor});

  @override
  $SubcontractorCopyWith<$Res>? get subcontractor;
}

/// @nodoc
class __$$_ChildCompanyCopyWithImpl<$Res>
    extends _$ChildCompanyCopyWithImpl<$Res>
    implements _$$_ChildCompanyCopyWith<$Res> {
  __$$_ChildCompanyCopyWithImpl(
      _$_ChildCompany _value, $Res Function(_$_ChildCompany) _then)
      : super(_value, (v) => _then(v as _$_ChildCompany));

  @override
  _$_ChildCompany get _value => super._value as _$_ChildCompany;

  @override
  $Res call({
    Object? subcontractor = freezed,
  }) {
    return _then(_$_ChildCompany(
      subcontractor: subcontractor == freezed
          ? _value.subcontractor
          : subcontractor // ignore: cast_nullable_to_non_nullable
              as Subcontractor?,
    ));
  }
}

/// @nodoc

class _$_ChildCompany with DiagnosticableTreeMixin implements _ChildCompany {
  _$_ChildCompany({this.subcontractor});

  @override
  final Subcontractor? subcontractor;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChildCompany(subcontractor: $subcontractor)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChildCompany'))
      ..add(DiagnosticsProperty('subcontractor', subcontractor));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChildCompany &&
            const DeepCollectionEquality()
                .equals(other.subcontractor, subcontractor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(subcontractor));

  @JsonKey(ignore: true)
  @override
  _$$_ChildCompanyCopyWith<_$_ChildCompany> get copyWith =>
      __$$_ChildCompanyCopyWithImpl<_$_ChildCompany>(this, _$identity);
}

abstract class _ChildCompany implements ChildCompany {
  factory _ChildCompany({final Subcontractor? subcontractor}) = _$_ChildCompany;

  @override
  Subcontractor? get subcontractor;
  @override
  @JsonKey(ignore: true)
  _$$_ChildCompanyCopyWith<_$_ChildCompany> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$Subcontractor {
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubcontractorCopyWith<Subcontractor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubcontractorCopyWith<$Res> {
  factory $SubcontractorCopyWith(
          Subcontractor value, $Res Function(Subcontractor) then) =
      _$SubcontractorCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$SubcontractorCopyWithImpl<$Res>
    implements $SubcontractorCopyWith<$Res> {
  _$SubcontractorCopyWithImpl(this._value, this._then);

  final Subcontractor _value;
  // ignore: unused_field
  final $Res Function(Subcontractor) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SubcontractorCopyWith<$Res>
    implements $SubcontractorCopyWith<$Res> {
  factory _$$_SubcontractorCopyWith(
          _$_Subcontractor value, $Res Function(_$_Subcontractor) then) =
      __$$_SubcontractorCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class __$$_SubcontractorCopyWithImpl<$Res>
    extends _$SubcontractorCopyWithImpl<$Res>
    implements _$$_SubcontractorCopyWith<$Res> {
  __$$_SubcontractorCopyWithImpl(
      _$_Subcontractor _value, $Res Function(_$_Subcontractor) _then)
      : super(_value, (v) => _then(v as _$_Subcontractor));

  @override
  _$_Subcontractor get _value => super._value as _$_Subcontractor;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$_Subcontractor(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Subcontractor with DiagnosticableTreeMixin implements _Subcontractor {
  _$_Subcontractor({this.name = ''});

  @override
  @JsonKey()
  final String name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Subcontractor(name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Subcontractor'))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Subcontractor &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_SubcontractorCopyWith<_$_Subcontractor> get copyWith =>
      __$$_SubcontractorCopyWithImpl<_$_Subcontractor>(this, _$identity);
}

abstract class _Subcontractor implements Subcontractor {
  factory _Subcontractor({final String name}) = _$_Subcontractor;

  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_SubcontractorCopyWith<_$_Subcontractor> get copyWith =>
      throw _privateConstructorUsedError;
}
