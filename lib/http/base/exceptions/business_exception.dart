class BusinessException implements Exception {
  final int code;
  final String message;

  BusinessException({required this.code, required this.message});

  @override
  String toString() {
    return 'BusinessException{code: $code, message: $message}';
  }
}
