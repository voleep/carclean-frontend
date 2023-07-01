import 'package:json_annotation/json_annotation.dart';

part 'request_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class RequestResponseModel<T> {
  final T? data;
  final String? errorMessage;

  const RequestResponseModel({required this.data, this.errorMessage});

  factory RequestResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$RequestResponseModelFromJson(json, fromJsonT);
}
