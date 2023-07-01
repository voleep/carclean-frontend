extension NotEmptyOrNull on String {
  String? get notEmptyOrNull {
    if (isEmpty) {
      return null;
    }

    return this;
  }
}
