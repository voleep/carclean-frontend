import 'package:json_annotation/json_annotation.dart';

part 'request_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class RequestResponseModel<T> {
  final String? errorCode;
  final T? data;
  final String? errorMessage;

  const RequestResponseModel(
      {this.errorCode, required this.data, this.errorMessage});

  factory RequestResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$RequestResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$RequestResponseModelToJson(this, toJsonT);
}
