// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_employee_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateEmployeeCommand {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get registrationDate => throw _privateConstructorUsedError;
  EmployeeStatus get status => throw _privateConstructorUsedError;
  String? get telephone => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateEmployeeCommandCopyWith<CreateEmployeeCommand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateEmployeeCommandCopyWith<$Res> {
  factory $CreateEmployeeCommandCopyWith(CreateEmployeeCommand value,
          $Res Function(CreateEmployeeCommand) then) =
      _$CreateEmployeeCommandCopyWithImpl<$Res, CreateEmployeeCommand>;
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime registrationDate,
      EmployeeStatus status,
      String? telephone});
}

/// @nodoc
class _$CreateEmployeeCommandCopyWithImpl<$Res,
        $Val extends CreateEmployeeCommand>
    implements $CreateEmployeeCommandCopyWith<$Res> {
  _$CreateEmployeeCommandCopyWithImpl(this._value, this._then);

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
    Object? telephone = freezed,
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
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateEmployeeCommandCopyWith<$Res>
    implements $CreateEmployeeCommandCopyWith<$Res> {
  factory _$$_CreateEmployeeCommandCopyWith(_$_CreateEmployeeCommand value,
          $Res Function(_$_CreateEmployeeCommand) then) =
      __$$_CreateEmployeeCommandCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime registrationDate,
      EmployeeStatus status,
      String? telephone});
}

/// @nodoc
class __$$_CreateEmployeeCommandCopyWithImpl<$Res>
    extends _$CreateEmployeeCommandCopyWithImpl<$Res, _$_CreateEmployeeCommand>
    implements _$$_CreateEmployeeCommandCopyWith<$Res> {
  __$$_CreateEmployeeCommandCopyWithImpl(_$_CreateEmployeeCommand _value,
      $Res Function(_$_CreateEmployeeCommand) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? registrationDate = null,
    Object? status = null,
    Object? telephone = freezed,
  }) {
    return _then(_$_CreateEmployeeCommand(
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
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_CreateEmployeeCommand implements _CreateEmployeeCommand {
  _$_CreateEmployeeCommand(
      {required this.id,
      required this.name,
      required this.registrationDate,
      required this.status,
      this.telephone});

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime registrationDate;
  @override
  final EmployeeStatus status;
  @override
  final String? telephone;

  @override
  String toString() {
    return 'CreateEmployeeCommand(id: $id, name: $name, registrationDate: $registrationDate, status: $status, telephone: $telephone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateEmployeeCommand &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.registrationDate, registrationDate) ||
                other.registrationDate == registrationDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, registrationDate, status, telephone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateEmployeeCommandCopyWith<_$_CreateEmployeeCommand> get copyWith =>
      __$$_CreateEmployeeCommandCopyWithImpl<_$_CreateEmployeeCommand>(
          this, _$identity);
}

abstract class _CreateEmployeeCommand implements CreateEmployeeCommand {
  factory _CreateEmployeeCommand(
      {required final String id,
      required final String name,
      required final DateTime registrationDate,
      required final EmployeeStatus status,
      final String? telephone}) = _$_CreateEmployeeCommand;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get registrationDate;
  @override
  EmployeeStatus get status;
  @override
  String? get telephone;
  @override
  @JsonKey(ignore: true)
  _$$_CreateEmployeeCommandCopyWith<_$_CreateEmployeeCommand> get copyWith =>
      throw _privateConstructorUsedError;
}
