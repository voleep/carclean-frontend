enum EmployeeStatus {
  enabled,
  disabled;

  static EmployeeStatus from(bool status) {
    return status ? EmployeeStatus.enabled : EmployeeStatus.disabled;
  }

  bool get boolean => this == EmployeeStatus.enabled ? true : false;
}
