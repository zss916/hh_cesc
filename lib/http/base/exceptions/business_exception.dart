class BusinessException implements Exception {
  final int code;
  final String message;

  BusinessException({
    required this.code,
    required this.message,
  });

  @override
  String toString() {
    return 'BusinessException{code: $code, message: $message}';
  }
}

class NetworkException implements Exception {
  final String message;

  NetworkException({required this.message});

  @override
  String toString() {
    return 'NetworkException{message: $message}';
  }
}

class TimeoutException implements Exception {
  final String message;

  TimeoutException({required this.message});

  @override
  String toString() {
    return 'TimeoutException{message: $message}';
  }
}