import 'package:dartz/dartz.dart';
import 'package:hey_flutter_task/domain/repositories/auth_repo.dart';

import '../../data/models/user_model.dart';
import '../entities/sign_in_entity.dart';
import '../entities/sign_up_entity.dart';
import '../faliures/failures.dart';

class SignInUseCase {
  final AuthRepo authRepo;
  SignInUseCase(this.authRepo);
  Future<Either<Failure, UserModel?>> execute(SignInEntity signInEntity) =>
      authRepo.signIn(signInEntity);
}

class SignUpUseCase {
  final AuthRepo authRepo;
  SignUpUseCase(this.authRepo);
  Future<Either<Failure, UserModel?>> execute(SignUpEntity signUpEntity) =>
      authRepo.signUp(signUpEntity);
}

class UserExistUseCase {
  final AuthRepo authRepo;
  UserExistUseCase(this.authRepo);
  Future<Either<Failure, UserModel?>> execute(String email) =>
      authRepo.isUserExist(email);
}
