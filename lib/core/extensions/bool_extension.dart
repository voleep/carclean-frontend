extension BoolExtension on bool {
  R ifTrueElse<R>(R Function() block, R Function() orElse) {
    if (this) return block();
    return orElse();
  }
}
