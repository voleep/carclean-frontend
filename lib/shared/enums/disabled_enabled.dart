import 'package:json_annotation/json_annotation.dart';

enum DisabledEnabled {
  @JsonValue(0)
  disabled,
  @JsonValue(1)
  enabled;

  bool get boolean => this == DisabledEnabled.disabled ? false : true;

  static DisabledEnabled fromBool(bool value) => value == true ? DisabledEnabled.enabled : DisabledEnabled.disabled;
}
