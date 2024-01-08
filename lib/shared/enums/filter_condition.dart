enum FilterCondition {
  equals,
  notEquals,
  includes,
  notIncludes,
  greater,
  greaterOrEquals,
  lower,
  lowerOrEquals;

  String get key {
    switch (this) {
      case equals:
        return ":";
      case notEquals:
        return "<>";
      case includes:
        return ":";
      case notIncludes:
        return "<>";
      case greater:
        return ">";
      case greaterOrEquals:
        return ">=";
      case lower:
        return "<";
      case lowerOrEquals:
        return "<=";
    }
  }

  String get label {
    switch (this) {
      case equals:
        return "Igual";
      case notEquals:
        return "Diferente";
      case includes:
        return "Contém";
      case notIncludes:
        return "Não contém";
      case greater:
        return "Maior que";
      case greaterOrEquals:
        return "Maior ou igual";
      case lower:
        return "Menor que";
      case lowerOrEquals:
        return "Menor ou igual";
    }
  }
}
