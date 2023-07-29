// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomerModel _$CustomerModelFromJson(Map<String, dynamic> json) {
  return _CustomerModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerModel {
  String get customerId => throw _privateConstructorUsedError;
  String get dsName => throw _privateConstructorUsedError;
  String? get dsTelephone => throw _privateConstructorUsedError;
  String? get dsEmail => throw _privateConstructorUsedError;
  String? get dsDocument => throw _privateConstructorUsedError;
  String? get dsNote => throw _privateConstructorUsedError;
  DisabledEnabled get stCustomer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomerModelCopyWith<CustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerModelCopyWith<$Res> {
  factory $CustomerModelCopyWith(
          CustomerModel value, $Res Function(CustomerModel) then) =
      _$CustomerModelCopyWithImpl<$Res, CustomerModel>;
  @useResult
  $Res call(
      {String customerId,
      String dsName,
      String? dsTelephone,
      String? dsEmail,
      String? dsDocument,
      String? dsNote,
      DisabledEnabled stCustomer});
}

/// @nodoc
class _$CustomerModelCopyWithImpl<$Res, $Val extends CustomerModel>
    implements $CustomerModelCopyWith<$Res> {
  _$CustomerModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? dsName = null,
    Object? dsTelephone = freezed,
    Object? dsEmail = freezed,
    Object? dsDocument = freezed,
    Object? dsNote = freezed,
    Object? stCustomer = null,
  }) {
    return _then(_value.copyWith(
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      dsName: null == dsName
          ? _value.dsName
          : dsName // ignore: cast_nullable_to_non_nullable
              as String,
      dsTelephone: freezed == dsTelephone
          ? _value.dsTelephone
          : dsTelephone // ignore: cast_nullable_to_non_nullable
              as String?,
      dsEmail: freezed == dsEmail
          ? _value.dsEmail
          : dsEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      dsDocument: freezed == dsDocument
          ? _value.dsDocument
          : dsDocument // ignore: cast_nullable_to_non_nullable
              as String?,
      dsNote: freezed == dsNote
          ? _value.dsNote
          : dsNote // ignore: cast_nullable_to_non_nullable
              as String?,
      stCustomer: null == stCustomer
          ? _value.stCustomer
          : stCustomer // ignore: cast_nullable_to_non_nullable
              as DisabledEnabled,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomerModelCopyWith<$Res>
    implements $CustomerModelCopyWith<$Res> {
  factory _$$_CustomerModelCopyWith(
          _$_CustomerModel value, $Res Function(_$_CustomerModel) then) =
      __$$_CustomerModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String customerId,
      String dsName,
      String? dsTelephone,
      String? dsEmail,
      String? dsDocument,
      String? dsNote,
      DisabledEnabled stCustomer});
}

/// @nodoc
class __$$_CustomerModelCopyWithImpl<$Res>
    extends _$CustomerModelCopyWithImpl<$Res, _$_CustomerModel>
    implements _$$_CustomerModelCopyWith<$Res> {
  __$$_CustomerModelCopyWithImpl(
      _$_CustomerModel _value, $Res Function(_$_CustomerModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? dsName = null,
    Object? dsTelephone = freezed,
    Object? dsEmail = freezed,
    Object? dsDocument = freezed,
    Object? dsNote = freezed,
    Object? stCustomer = null,
  }) {
    return _then(_$_CustomerModel(
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      dsName: null == dsName
          ? _value.dsName
          : dsName // ignore: cast_nullable_to_non_nullable
              as String,
      dsTelephone: freezed == dsTelephone
          ? _value.dsTelephone
          : dsTelephone // ignore: cast_nullable_to_non_nullable
              as String?,
      dsEmail: freezed == dsEmail
          ? _value.dsEmail
          : dsEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      dsDocument: freezed == dsDocument
          ? _value.dsDocument
          : dsDocument // ignore: cast_nullable_to_non_nullable
              as String?,
      dsNote: freezed == dsNote
          ? _value.dsNote
          : dsNote // ignore: cast_nullable_to_non_nullable
              as String?,
      stCustomer: null == stCustomer
          ? _value.stCustomer
          : stCustomer // ignore: cast_nullable_to_non_nullable
              as DisabledEnabled,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CustomerModel with DiagnosticableTreeMixin implements _CustomerModel {
  const _$_CustomerModel(
      {required this.customerId,
      required this.dsName,
      this.dsTelephone,
      this.dsEmail,
      this.dsDocument,
      this.dsNote,
      required this.stCustomer});

  factory _$_CustomerModel.fromJson(Map<String, dynamic> json) =>
      _$$_CustomerModelFromJson(json);

  @override
  final String customerId;
  @override
  final String dsName;
  @override
  final String? dsTelephone;
  @override
  final String? dsEmail;
  @override
  final String? dsDocument;
  @override
  final String? dsNote;
  @override
  final DisabledEnabled stCustomer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CustomerModel(customerId: $customerId, dsName: $dsName, dsTelephone: $dsTelephone, dsEmail: $dsEmail, dsDocument: $dsDocument, dsNote: $dsNote, stCustomer: $stCustomer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CustomerModel'))
      ..add(DiagnosticsProperty('customerId', customerId))
      ..add(DiagnosticsProperty('dsName', dsName))
      ..add(DiagnosticsProperty('dsTelephone', dsTelephone))
      ..add(DiagnosticsProperty('dsEmail', dsEmail))
      ..add(DiagnosticsProperty('dsDocument', dsDocument))
      ..add(DiagnosticsProperty('dsNote', dsNote))
      ..add(DiagnosticsProperty('stCustomer', stCustomer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomerModel &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.dsName, dsName) || other.dsName == dsName) &&
            (identical(other.dsTelephone, dsTelephone) ||
                other.dsTelephone == dsTelephone) &&
            (identical(other.dsEmail, dsEmail) || other.dsEmail == dsEmail) &&
            (identical(other.dsDocument, dsDocument) ||
                other.dsDocument == dsDocument) &&
            (identical(other.dsNote, dsNote) || other.dsNote == dsNote) &&
            (identical(other.stCustomer, stCustomer) ||
                other.stCustomer == stCustomer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, customerId, dsName, dsTelephone,
      dsEmail, dsDocument, dsNote, stCustomer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomerModelCopyWith<_$_CustomerModel> get copyWith =>
      __$$_CustomerModelCopyWithImpl<_$_CustomerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomerModelToJson(
      this,
    );
  }
}

abstract class _CustomerModel implements CustomerModel {
  const factory _CustomerModel(
      {required final String customerId,
      required final String dsName,
      final String? dsTelephone,
      final String? dsEmail,
      final String? dsDocument,
      final String? dsNote,
      required final DisabledEnabled stCustomer}) = _$_CustomerModel;

  factory _CustomerModel.fromJson(Map<String, dynamic> json) =
      _$_CustomerModel.fromJson;

  @override
  String get customerId;
  @override
  String get dsName;
  @override
  String? get dsTelephone;
  @override
  String? get dsEmail;
  @override
  String? get dsDocument;
  @override
  String? get dsNote;
  @override
  DisabledEnabled get stCustomer;
  @override
  @JsonKey(ignore: true)
  _$$_CustomerModelCopyWith<_$_CustomerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
