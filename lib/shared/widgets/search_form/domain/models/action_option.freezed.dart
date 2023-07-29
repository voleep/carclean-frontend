// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'action_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ActionOption {
  String get title => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  Color get backgroundColor => throw _privateConstructorUsedError;
  VoidCallback get onTap => throw _privateConstructorUsedError;
  Color? get foregroundColor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ActionOptionCopyWith<ActionOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActionOptionCopyWith<$Res> {
  factory $ActionOptionCopyWith(
          ActionOption value, $Res Function(ActionOption) then) =
      _$ActionOptionCopyWithImpl<$Res, ActionOption>;
  @useResult
  $Res call(
      {String title,
      IconData icon,
      Color backgroundColor,
      VoidCallback onTap,
      Color? foregroundColor});
}

/// @nodoc
class _$ActionOptionCopyWithImpl<$Res, $Val extends ActionOption>
    implements $ActionOptionCopyWith<$Res> {
  _$ActionOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? icon = null,
    Object? backgroundColor = null,
    Object? onTap = null,
    Object? foregroundColor = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      onTap: null == onTap
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
      foregroundColor: freezed == foregroundColor
          ? _value.foregroundColor
          : foregroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ActionOptionCopyWith<$Res>
    implements $ActionOptionCopyWith<$Res> {
  factory _$$_ActionOptionCopyWith(
          _$_ActionOption value, $Res Function(_$_ActionOption) then) =
      __$$_ActionOptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      IconData icon,
      Color backgroundColor,
      VoidCallback onTap,
      Color? foregroundColor});
}

/// @nodoc
class __$$_ActionOptionCopyWithImpl<$Res>
    extends _$ActionOptionCopyWithImpl<$Res, _$_ActionOption>
    implements _$$_ActionOptionCopyWith<$Res> {
  __$$_ActionOptionCopyWithImpl(
      _$_ActionOption _value, $Res Function(_$_ActionOption) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? icon = null,
    Object? backgroundColor = null,
    Object? onTap = null,
    Object? foregroundColor = freezed,
  }) {
    return _then(_$_ActionOption(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as Color,
      onTap: null == onTap
          ? _value.onTap
          : onTap // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
      foregroundColor: freezed == foregroundColor
          ? _value.foregroundColor
          : foregroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc

class _$_ActionOption implements _ActionOption {
  const _$_ActionOption(
      {required this.title,
      required this.icon,
      required this.backgroundColor,
      required this.onTap,
      this.foregroundColor});

  @override
  final String title;
  @override
  final IconData icon;
  @override
  final Color backgroundColor;
  @override
  final VoidCallback onTap;
  @override
  final Color? foregroundColor;

  @override
  String toString() {
    return 'ActionOption(title: $title, icon: $icon, backgroundColor: $backgroundColor, onTap: $onTap, foregroundColor: $foregroundColor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ActionOption &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.onTap, onTap) || other.onTap == onTap) &&
            (identical(other.foregroundColor, foregroundColor) ||
                other.foregroundColor == foregroundColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, title, icon, backgroundColor, onTap, foregroundColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActionOptionCopyWith<_$_ActionOption> get copyWith =>
      __$$_ActionOptionCopyWithImpl<_$_ActionOption>(this, _$identity);
}

abstract class _ActionOption implements ActionOption {
  const factory _ActionOption(
      {required final String title,
      required final IconData icon,
      required final Color backgroundColor,
      required final VoidCallback onTap,
      final Color? foregroundColor}) = _$_ActionOption;

  @override
  String get title;
  @override
  IconData get icon;
  @override
  Color get backgroundColor;
  @override
  VoidCallback get onTap;
  @override
  Color? get foregroundColor;
  @override
  @JsonKey(ignore: true)
  _$$_ActionOptionCopyWith<_$_ActionOption> get copyWith =>
      throw _privateConstructorUsedError;
}
