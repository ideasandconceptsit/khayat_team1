// ملف api_exceptions.dart

class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => message;
}

class BadRequestException extends ApiException {
  BadRequestException(String message) : super(message);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(String message) : super(message);
}

class PaymentRequiredException extends ApiException {
  PaymentRequiredException(String message) : super(message);
}

class ServerException extends ApiException {
  ServerException(String message) : super(message);
}
