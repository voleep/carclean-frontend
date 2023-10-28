sealed class Either<E extends Exception, S> {}

class Failure<E extends Exception, S> extends Either<E, S> {
  final Exception exception;
  final StackTrace stackTrace;

  Failure(this.exception, this.stackTrace);
}

class Success<E extends Exception, S> extends Either<E, S> {
  final S value;

  Success(this.value);
}
