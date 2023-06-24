import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class VoleepSearchOptionsModel extends Equatable {
  final String endpoint;
  final String orderField;
  final String? query;

  const VoleepSearchOptionsModel(
      {required this.endpoint, required this.orderField, this.query});

  @override
  List<Object?> get props => [
        endpoint,
        orderField,
        query,
      ];
}
