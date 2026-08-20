enum ErrorState { error, exception }

// 密封响应类型
sealed class ApiResult<T> {}

class ApiSuccess<T> extends ApiResult<T> {
  final T data;
  ApiSuccess(this.data);
}

class ApiError<T> extends ApiResult<T> {
  final String? msg;
  final ErrorState? errorState;
  ApiError({this.errorState, this.msg});
}
