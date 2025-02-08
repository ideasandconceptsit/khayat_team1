class ApiException implements Exception {
  final String message;
  ApiException(this.message);

  @override
  String toString() => "ApiException: $message";
}
//=================================================================
class NetworkException extends ApiException {
  NetworkException() : super("No internet connection. Please try again.");
}
//=================================================================
class ServerException extends ApiException {
  ServerException(String message) : super(message);
}









