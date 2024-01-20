extension InlineExtension<T> on T {
  R let<R>(R Function(T it) block) {
    return block(this);
  }

  bool get isNull => this == null;
}
