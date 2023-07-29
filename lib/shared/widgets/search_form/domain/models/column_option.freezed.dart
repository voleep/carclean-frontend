// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'column_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ColumnOption {
  String get title => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;
  bool get isFixed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ColumnOptionCopyWith<ColumnOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColumnOptionCopyWith<$Res> {
  factory $ColumnOptionCopyWith(
          ColumnOption value, $Res Function(ColumnOption) then) =
      _$ColumnOptionCopyWithImpl<$Res, ColumnOption>;
  @useResult
  $Res call({String title, double width, bool isFixed});
}

/// @nodoc
class _$ColumnOptionCopyWithImpl<$Res, $Val extends ColumnOption>
    implements $ColumnOptionCopyWith<$Res> {
  _$ColumnOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? width = null,
    Object? isFixed = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      isFixed: null == isFixed
          ? _value.isFixed
          : isFixed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ColumnOptionCopyWith<$Res>
    implements $ColumnOptionCopyWith<$Res> {
  factory _$$_ColumnOptionCopyWith(
          _$_ColumnOption value, $Res Function(_$_ColumnOption) then) =
      __$$_ColumnOptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, double width, bool isFixed});
}

/// @nodoc
class __$$_ColumnOptionCopyWithImpl<$Res>
    extends _$ColumnOptionCopyWithImpl<$Res, _$_ColumnOption>
    implements _$$_ColumnOptionCopyWith<$Res> {
  __$$_ColumnOptionCopyWithImpl(
      _$_ColumnOption _value, $Res Function(_$_ColumnOption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? width = null,
    Object? isFixed = null,
  }) {
    return _then(_$_ColumnOption(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
      isFixed: null == isFixed
          ? _value.isFixed
          : isFixed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ColumnOption with DiagnosticableTreeMixin implements _ColumnOption {
  const _$_ColumnOption(
      {required this.title, required this.width, this.isFixed = false});

  @override
  final String title;
  @override
  final double width;
  @override
  @JsonKey()
  final bool isFixed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ColumnOption(title: $title, width: $width, isFixed: $isFixed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ColumnOption'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('width', width))
      ..add(DiagnosticsProperty('isFixed', isFixed));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ColumnOption &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.isFixed, isFixed) || other.isFixed == isFixed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, width, isFixed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ColumnOptionCopyWith<_$_ColumnOption> get copyWith =>
      __$$_ColumnOptionCopyWithImpl<_$_ColumnOption>(this, _$identity);
}

abstract class _ColumnOption implements ColumnOption {
  const factory _ColumnOption(
      {required final String title,
      required final double width,
      final bool isFixed}) = _$_ColumnOption;

  @override
  String get title;
  @override
  double get width;
  @override
  bool get isFixed;
  @override
  @JsonKey(ignore: true)
  _$$_ColumnOptionCopyWith<_$_ColumnOption> get copyWith =>
      throw _privateConstructorUsedError;
}
