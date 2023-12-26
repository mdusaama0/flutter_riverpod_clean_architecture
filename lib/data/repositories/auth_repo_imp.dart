import 'package:dartz/dartz.dart';
import 'package:hey_flutter_task/domain/entities/sign_in_entity.dart';
import 'package:hey_flutter_task/domain/entities/sign_up_entity.dart';
import 'package:hey_flutter_task/domain/repositories/auth_repo.dart';

import '../../domain/exceptions/exceptions.dart';
import '../../domain/faliures/failures.dart';
import '../data_source/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepoImp implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepoImp(this.authRemoteDataSource);
  @override
  Future<Either<Failure, UserModel?>> signIn(SignInEntity signInEntity) async {
    try {
      final userCredential = await authRemoteDataSource.signIn(signInEntity);
      return Right(userCredential);
    } on ExistedAccountException catch (e) {
      return Left(ExistedAccountFailure(e.message));
    } on WrongPasswordException catch (e) {
      return Left(WrongPasswordFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> signUp(SignUpEntity signUpEntity) async {
    try {
      final userCredential = await authRemoteDataSource.signUp(signUpEntity);
      return Right(userCredential);
    } on WeekPassException catch (e) {
      return Left(WeekPassFailure(e.message));
    } on ExistedAccountException catch (e) {
      return Left(ExistedAccountFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> isUserExist(String email) async {
    try {
      final isExist = await authRemoteDataSource.isUserExist(email);
      if (isExist == null) {
        return const Right(null);
      } else {
        return Right(isExist);
      }
    } on NoUserException catch (e) {
      return Left(NoUserFailure(e.message));
    }
  }
}
