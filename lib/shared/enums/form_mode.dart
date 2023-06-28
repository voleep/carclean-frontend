enum FormMode {
  create,
  update,
  copy;

  static FormMode valueOf(String mode) {
    return FormMode.values.byName(mode);
  }
}
