enum Selection {
  none,
  single,
  multi;

  static Selection byName(String name) {
    return Selection.values.byName(name);
  }

  @override
  toString() {
    return name;
  }
}
