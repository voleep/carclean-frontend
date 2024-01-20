// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmployeeState {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get registrationDate => throw _privateConstructorUsedError;
  EmployeeStatus get status => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String? get getFeedback => throw _privateConstructorUsedError;
  String? get saveFeedback => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmployeeStateCopyWith<EmployeeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeStateCopyWith<$Res> {
  factory $EmployeeStateCopyWith(
          EmployeeState value, $Res Function(EmployeeState) then) =
      _$EmployeeStateCopyWithImpl<$Res, EmployeeState>;
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime registrationDate,
      EmployeeStatus status,
      String? phone,
      String? getFeedback,
      String? saveFeedback});
}

/// @nodoc
class _$EmployeeStateCopyWithImpl<$Res, $Val extends EmployeeState>
    implements $EmployeeStateCopyWith<$Res> {
  _$EmployeeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? registrationDate = null,
    Object? status = null,
    Object? phone = freezed,
    Object? getFeedback = freezed,
    Object? saveFeedback = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      registrationDate: null == registrationDate
          ? _value.registrationDate
          : registrationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EmployeeStatus,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      getFeedback: freezed == getFeedback
          ? _value.getFeedback
          : getFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
      saveFeedback: freezed == saveFeedback
          ? _value.saveFeedback
          : saveFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmployeeStateCopyWith<$Res>
    implements $EmployeeStateCopyWith<$Res> {
  factory _$$_EmployeeStateCopyWith(
          _$_EmployeeState value, $Res Function(_$_EmployeeState) then) =
      __$$_EmployeeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime registrationDate,
      EmployeeStatus status,
      String? phone,
      String? getFeedback,
      String? saveFeedback});
}

/// @nodoc
class __$$_EmployeeStateCopyWithImpl<$Res>
    extends _$EmployeeStateCopyWithImpl<$Res, _$_EmployeeState>
    implements _$$_EmployeeStateCopyWith<$Res> {
  __$$_EmployeeStateCopyWithImpl(
      _$_EmployeeState _value, $Res Function(_$_EmployeeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? registrationDate = null,
    Object? status = null,
    Object? phone = freezed,
    Object? getFeedback = freezed,
    Object? saveFeedback = freezed,
  }) {
    return _then(_$_EmployeeState(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      registrationDate: null == registrationDate
          ? _value.registrationDate
          : registrationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EmployeeStatus,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      getFeedback: freezed == getFeedback
          ? _value.getFeedback
          : getFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
      saveFeedback: freezed == saveFeedback
          ? _value.saveFeedback
          : saveFeedback // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_EmployeeState extends _EmployeeState {
  _$_EmployeeState(
      {required this.id,
      required this.name,
      required this.registrationDate,
      required this.status,
      this.phone,
      this.getFeedback,
      this.saveFeedback})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime registrationDate;
  @override
  final EmployeeStatus status;
  @override
  final String? phone;
  @override
  final String? getFeedback;
  @override
  final String? saveFeedback;

  @override
  String toString() {
    return 'EmployeeState(id: $id, name: $name, registrationDate: $registrationDate, status: $status, phone: $phone, getFeedback: $getFeedback, saveFeedback: $saveFeedback)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmployeeState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.registrationDate, registrationDate) ||
                other.registrationDate == registrationDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.getFeedback, getFeedback) ||
                other.getFeedback == getFeedback) &&
            (identical(other.saveFeedback, saveFeedback) ||
                other.saveFeedback == saveFeedback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, registrationDate,
      status, phone, getFeedback, saveFeedback);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmployeeStateCopyWith<_$_EmployeeState> get copyWith =>
      __$$_EmployeeStateCopyWithImpl<_$_EmployeeState>(this, _$identity);
}

abstract class _EmployeeState extends EmployeeState {
  factory _EmployeeState(
      {required final String id,
      required final String name,
      required final DateTime registrationDate,
      required final EmployeeStatus status,
      final String? phone,
      final String? getFeedback,
      final String? saveFeedback}) = _$_EmployeeState;
  _EmployeeState._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get registrationDate;
  @override
  EmployeeStatus get status;
  @override
  String? get phone;
  @override
  String? get getFeedback;
  @override
  String? get saveFeedback;
  @override
  @JsonKey(ignore: true)
  _$$_EmployeeStateCopyWith<_$_EmployeeState> get copyWith =>
      throw _privateConstructorUsedError;
}
