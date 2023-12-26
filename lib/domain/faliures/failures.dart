import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);
}

class OfflineFailure extends Failure {
  const OfflineFailure(super.message);

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  @override
  List<Object?> get props => [];
}

class WeekPassFailure extends Failure {
  const WeekPassFailure(super.message);

  @override
  List<Object?> get props => [];
}

class ExistedAccountFailure extends Failure {
  const ExistedAccountFailure(super.message);

  @override
  List<Object?> get props => [];
}

class NoUserFailure extends Failure {
  const NoUserFailure(super.message);

  @override
  List<Object?> get props => [];
}

class WrongPasswordFailure extends Failure {
  const WrongPasswordFailure(super.message);

  @override
  List<Object?> get props => [];
}

class UnmatchedPassFailure extends Failure {
  const UnmatchedPassFailure(super.message);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class NotLoggedInFailure extends Failure {
  const NotLoggedInFailure(super.message);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class EmailVerifiedFailure extends Failure {
  const EmailVerifiedFailure(super.message);

  @override
  List<Object?> get props => throw UnimplementedError();
}

class TooManyRequestsFailure extends Failure {
  const TooManyRequestsFailure(super.message);

  @override
  List<Object?> get props => throw UnimplementedError();
}
