class ServerException implements Exception {}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}

class TokenException implements Exception {
  final String message;

  TokenException(this.message);
}
