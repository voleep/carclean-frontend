// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EmployeeModel _$EmployeeModelFromJson(Map<String, dynamic> json) {
  return _EmployeeModel.fromJson(json);
}

/// @nodoc
mixin _$EmployeeModel {
  String get employeeId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get telephone => throw _privateConstructorUsedError;
  @Timestamp()
  DateTime get registrationDate => throw _privateConstructorUsedError;
  DisabledEnabled get situation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmployeeModelCopyWith<EmployeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmployeeModelCopyWith<$Res> {
  factory $EmployeeModelCopyWith(
          EmployeeModel value, $Res Function(EmployeeModel) then) =
      _$EmployeeModelCopyWithImpl<$Res, EmployeeModel>;
  @useResult
  $Res call(
      {String employeeId,
      String name,
      String? telephone,
      @Timestamp() DateTime registrationDate,
      DisabledEnabled situation});
}

/// @nodoc
class _$EmployeeModelCopyWithImpl<$Res, $Val extends EmployeeModel>
    implements $EmployeeModelCopyWith<$Res> {
  _$EmployeeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = null,
    Object? name = null,
    Object? telephone = freezed,
    Object? registrationDate = null,
    Object? situation = null,
  }) {
    return _then(_value.copyWith(
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationDate: null == registrationDate
          ? _value.registrationDate
          : registrationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      situation: null == situation
          ? _value.situation
          : situation // ignore: cast_nullable_to_non_nullable
              as DisabledEnabled,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmployeeModelCopyWith<$Res>
    implements $EmployeeModelCopyWith<$Res> {
  factory _$$_EmployeeModelCopyWith(
          _$_EmployeeModel value, $Res Function(_$_EmployeeModel) then) =
      __$$_EmployeeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String employeeId,
      String name,
      String? telephone,
      @Timestamp() DateTime registrationDate,
      DisabledEnabled situation});
}

/// @nodoc
class __$$_EmployeeModelCopyWithImpl<$Res>
    extends _$EmployeeModelCopyWithImpl<$Res, _$_EmployeeModel>
    implements _$$_EmployeeModelCopyWith<$Res> {
  __$$_EmployeeModelCopyWithImpl(
      _$_EmployeeModel _value, $Res Function(_$_EmployeeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = null,
    Object? name = null,
    Object? telephone = freezed,
    Object? registrationDate = null,
    Object? situation = null,
  }) {
    return _then(_$_EmployeeModel(
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: freezed == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String?,
      registrationDate: null == registrationDate
          ? _value.registrationDate
          : registrationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      situation: null == situation
          ? _value.situation
          : situation // ignore: cast_nullable_to_non_nullable
              as DisabledEnabled,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EmployeeModel with DiagnosticableTreeMixin implements _EmployeeModel {
  const _$_EmployeeModel(
      {required this.employeeId,
      required this.name,
      this.telephone,
      @Timestamp() required this.registrationDate,
      required this.situation});

  factory _$_EmployeeModel.fromJson(Map<String, dynamic> json) =>
      _$$_EmployeeModelFromJson(json);

  @override
  final String employeeId;
  @override
  final String name;
  @override
  final String? telephone;
  @override
  @Timestamp()
  final DateTime registrationDate;
  @override
  final DisabledEnabled situation;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EmployeeModel(employeeId: $employeeId, name: $name, telephone: $telephone, registrationDate: $registrationDate, situation: $situation)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EmployeeModel'))
      ..add(DiagnosticsProperty('employeeId', employeeId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('telephone', telephone))
      ..add(DiagnosticsProperty('registrationDate', registrationDate))
      ..add(DiagnosticsProperty('situation', situation));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmployeeModel &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.registrationDate, registrationDate) ||
                other.registrationDate == registrationDate) &&
            (identical(other.situation, situation) ||
                other.situation == situation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, employeeId, name, telephone, registrationDate, situation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmployeeModelCopyWith<_$_EmployeeModel> get copyWith =>
      __$$_EmployeeModelCopyWithImpl<_$_EmployeeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EmployeeModelToJson(
      this,
    );
  }
}

abstract class _EmployeeModel implements EmployeeModel {
  const factory _EmployeeModel(
      {required final String employeeId,
      required final String name,
      final String? telephone,
      @Timestamp() required final DateTime registrationDate,
      required final DisabledEnabled situation}) = _$_EmployeeModel;

  factory _EmployeeModel.fromJson(Map<String, dynamic> json) =
      _$_EmployeeModel.fromJson;

  @override
  String get employeeId;
  @override
  String get name;
  @override
  String? get telephone;
  @override
  @Timestamp()
  DateTime get registrationDate;
  @override
  DisabledEnabled get situation;
  @override
  @JsonKey(ignore: true)
  _$$_EmployeeModelCopyWith<_$_EmployeeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
