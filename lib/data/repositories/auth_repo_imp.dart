import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hey_flutter_task/domain/repositories/auth_repo.dart';

import '../../domain/exceptions/exceptions.dart';
import '../../domain/faliures/failures.dart';
import '../data_source/auth_remote_data_source.dart';

class AuthRepoImp implements AuthRepo {
  late final AuthRemoteDataSource authRemoteDataSource;
  @override
  Future<Either<Failure, UserCredential>> signIn(
      String email, String password) async {
    try {
      final userCredential = await authRemoteDataSource.signIn(email, password);
      return Right(userCredential);
    } on ExistedAccountException {
      return Left(ExistedAccountFailure());
    } on WrongPasswordException {
      return Left(WrongPasswordFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
