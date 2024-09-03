sealed class ApiResult<T, E> {
  ApiResult();

  factory ApiResult.success(T data) => ApiSuccess<T, E>(data);
  factory ApiResult.fail(E exception) => ApiFail<T, E>(exception);
}

class ApiSuccess<T, _> extends ApiResult<T, _> {
  ApiSuccess(this.data);

  final T data;
}

class ApiFail<_, E> extends ApiResult<_, E> {
  ApiFail(this.exception);

  final E exception;
}
