class ServerException implements Exception {}

class DatabaseException implements Exception {
  final String message;

  DatabaseException(this.message);
}

class TokenException implements Exception {
  final String message;

  TokenException(this.message);
}

class BadRequestException implements Exception {
  final String message;

  BadRequestException(this.message);
}

class NotFoundException implements Exception {
  final String message;

  NotFoundException(this.message);
}
