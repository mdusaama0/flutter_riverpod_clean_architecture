class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class OfflineException implements Exception {
  final String message;

  OfflineException(this.message);
}

class WeekPassException implements Exception {
  final String message;

  WeekPassException(this.message);
}

class ExistedAccountException implements Exception {
  final String message;

  ExistedAccountException(this.message);
}

class NoUserException implements Exception {
  final String message;

  NoUserException(this.message);
}

class WrongPasswordException implements Exception {
  final String message;

  WrongPasswordException(this.message);
}

class TooManyRequestsException implements Exception {
  final String message;

  TooManyRequestsException(this.message);
}
