import 'dart:async';

abstract class UseCase<IN, OUT> {
  FutureOr<OUT> execute(IN anIn);
}
