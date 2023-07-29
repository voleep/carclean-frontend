// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MenuModel {
  MenuGroup get group => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  GlobalKey<NavigatorState> get navigatorKey =>
      throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  Widget get child => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuModelCopyWith<MenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuModelCopyWith<$Res> {
  factory $MenuModelCopyWith(MenuModel value, $Res Function(MenuModel) then) =
      _$MenuModelCopyWithImpl<$Res, MenuModel>;
  @useResult
  $Res call(
      {MenuGroup group,
      String location,
      GlobalKey<NavigatorState> navigatorKey,
      String label,
      IconData icon,
      Widget child});
}

/// @nodoc
class _$MenuModelCopyWithImpl<$Res, $Val extends MenuModel>
    implements $MenuModelCopyWith<$Res> {
  _$MenuModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
    Object? location = null,
    Object? navigatorKey = null,
    Object? label = null,
    Object? icon = null,
    Object? child = null,
  }) {
    return _then(_value.copyWith(
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as MenuGroup,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      navigatorKey: null == navigatorKey
          ? _value.navigatorKey
          : navigatorKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<NavigatorState>,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      child: null == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MenuModelCopyWith<$Res> implements $MenuModelCopyWith<$Res> {
  factory _$$_MenuModelCopyWith(
          _$_MenuModel value, $Res Function(_$_MenuModel) then) =
      __$$_MenuModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MenuGroup group,
      String location,
      GlobalKey<NavigatorState> navigatorKey,
      String label,
      IconData icon,
      Widget child});
}

/// @nodoc
class __$$_MenuModelCopyWithImpl<$Res>
    extends _$MenuModelCopyWithImpl<$Res, _$_MenuModel>
    implements _$$_MenuModelCopyWith<$Res> {
  __$$_MenuModelCopyWithImpl(
      _$_MenuModel _value, $Res Function(_$_MenuModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? group = null,
    Object? location = null,
    Object? navigatorKey = null,
    Object? label = null,
    Object? icon = null,
    Object? child = null,
  }) {
    return _then(_$_MenuModel(
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as MenuGroup,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      navigatorKey: null == navigatorKey
          ? _value.navigatorKey
          : navigatorKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<NavigatorState>,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      child: null == child
          ? _value.child
          : child // ignore: cast_nullable_to_non_nullable
              as Widget,
    ));
  }
}

/// @nodoc

class _$_MenuModel implements _MenuModel {
  const _$_MenuModel(
      {required this.group,
      required this.location,
      required this.navigatorKey,
      required this.label,
      required this.icon,
      required this.child});

  @override
  final MenuGroup group;
  @override
  final String location;
  @override
  final GlobalKey<NavigatorState> navigatorKey;
  @override
  final String label;
  @override
  final IconData icon;
  @override
  final Widget child;

  @override
  String toString() {
    return 'MenuModel(group: $group, location: $location, navigatorKey: $navigatorKey, label: $label, icon: $icon, child: $child)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MenuModel &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.navigatorKey, navigatorKey) ||
                other.navigatorKey == navigatorKey) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.child, child) || other.child == child));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, group, location, navigatorKey, label, icon, child);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MenuModelCopyWith<_$_MenuModel> get copyWith =>
      __$$_MenuModelCopyWithImpl<_$_MenuModel>(this, _$identity);
}

abstract class _MenuModel implements MenuModel {
  const factory _MenuModel(
      {required final MenuGroup group,
      required final String location,
      required final GlobalKey<NavigatorState> navigatorKey,
      required final String label,
      required final IconData icon,
      required final Widget child}) = _$_MenuModel;

  @override
  MenuGroup get group;
  @override
  String get location;
  @override
  GlobalKey<NavigatorState> get navigatorKey;
  @override
  String get label;
  @override
  IconData get icon;
  @override
  Widget get child;
  @override
  @JsonKey(ignore: true)
  _$$_MenuModelCopyWith<_$_MenuModel> get copyWith =>
      throw _privateConstructorUsedError;
}
