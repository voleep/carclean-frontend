import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class VoleepSearchFamilyModel extends Equatable {
  final String endpoint;
  final String orderField;
  final String? query;

  const VoleepSearchFamilyModel(
      {required this.endpoint, required this.orderField, this.query});

  @override
  List<Object?> get props => [
        endpoint,
        query,
      ];
}
