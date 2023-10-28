// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fab_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FabOption {
  Widget get child => throw _privateConstructorUsedError;
  void Function() get onPressed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FabOptionCopyWith<FabOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FabOptionCopyWith<$Res> {
  factory $FabOptionCopyWith(FabOption value, $Res Function(FabOption) then) =
      _$FabOptionCopyWithImpl<$Res, FabOption>;
  @useResult
  $Res call({Widget child, void Function() onPressed});
}

/// @nodoc
class _$FabOptionCopyWithImpl<$Res, $Val extends FabOption>
    implements $FabOptionCopyWith<$Res> {
  _$FabOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? child = null,
    Object? onPressed = null,
  }) {
    return _then(_value.copyWith(
      child: null == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget,
      onPressed: null == onPressed
          ? _value.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as void Function(),
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FabOptionCopyWith<$Res> implements $FabOptionCopyWith<$Res> {
  factory _$$_FabOptionCopyWith(
          _$_FabOption value, $Res Function(_$_FabOption) then) =
      __$$_FabOptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Widget child, void Function() onPressed});
}

/// @nodoc
class __$$_FabOptionCopyWithImpl<$Res>
    extends _$FabOptionCopyWithImpl<$Res, _$_FabOption>
    implements _$$_FabOptionCopyWith<$Res> {
  __$$_FabOptionCopyWithImpl(
      _$_FabOption _value, $Res Function(_$_FabOption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? child = null,
    Object? onPressed = null,
  }) {
    return _then(_$_FabOption(
      child: null == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget,
      onPressed: null == onPressed
          ? _value.onPressed
          : onPressed // ignore: cast_nullable_to_non_nullable
              as void Function(),
    ));
  }
}

/// @nodoc

class _$_FabOption implements _FabOption {
  const _$_FabOption({required this.child, required this.onPressed});

  @override
  final Widget child;
  @override
  final void Function() onPressed;

  @override
  String toString() {
    return 'FabOption(child: $child, onPressed: $onPressed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FabOption &&
            (identical(other.child, child) || other.child == child) &&
            (identical(other.onPressed, onPressed) ||
                other.onPressed == onPressed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, child, onPressed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FabOptionCopyWith<_$_FabOption> get copyWith =>
      __$$_FabOptionCopyWithImpl<_$_FabOption>(this, _$identity);
}

abstract class _FabOption implements FabOption {
  const factory _FabOption(
      {required final Widget child,
      required final void Function() onPressed}) = _$_FabOption;

  @override
  Widget get child;
  @override
  void Function() get onPressed;
  @override
  @JsonKey(ignore: true)
  _$$_FabOptionCopyWith<_$_FabOption> get copyWith =>
      throw _privateConstructorUsedError;
}
