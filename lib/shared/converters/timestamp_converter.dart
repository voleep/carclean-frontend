import 'package:json_annotation/json_annotation.dart';

class TimestampOrNull implements JsonConverter<DateTime?, int?> {
  const TimestampOrNull();

  @override
  DateTime? fromJson(int? timestamp) {
    return timestamp != null ? DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000) : null;
  }

  @override
  int? toJson(DateTime? date) => date?.microsecondsSinceEpoch;
}

class Timestamp implements JsonConverter<DateTime, int> {
  const Timestamp();

  @override
  DateTime fromJson(int timestamp) {
    return DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
  }

  @override
  int toJson(DateTime date) => date.microsecondsSinceEpoch;
}
