enum FilterDateEnum {
  today,
  yesterday,
  thisWeek,
  thisMonth,
  lastMonth,
  specificDay,
  specificPeriod;

  String label() {
    switch (this) {
      case today:
        return "Hoje";
      case yesterday:
        return "Ontem";
      case thisWeek:
        return "Esta semana";
      case thisMonth:
        return "Este mês";
      case lastMonth:
        return "Mês passado";
      case specificDay:
        return "Dia específico";
      case specificPeriod:
        return "Período específico";
    }
  }
}
