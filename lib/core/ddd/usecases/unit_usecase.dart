import 'dart:async';

abstract class UnitUseCase<IN> {
  FutureOr<void> execute(IN anIn);
}
