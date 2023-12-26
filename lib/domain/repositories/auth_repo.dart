import 'package:dartz/dartz.dart';

import '../../data/models/user_model.dart';
import '../entities/sign_in_entity.dart';
import '../entities/sign_up_entity.dart';
import '../faliures/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel?>> signIn(SignInEntity signInEntity);
  Future<Either<Failure, UserModel?>> signUp(SignUpEntity signUpEntity);
  Future<Either<Failure, UserModel?>> isUserExist(String email);
}
