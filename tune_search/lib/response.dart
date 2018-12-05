abstract class Response {

  factory Response.success(value) = Success;
  factory Response.failure(Exception error) = Failure;
}

class Success implements Response {
  final value;
  const Success(this.value);
}

class Failure implements Response {
  final Exception error;
  const Failure(this.error);
}