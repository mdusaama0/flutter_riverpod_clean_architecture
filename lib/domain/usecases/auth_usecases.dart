import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hey_flutter_task/domain/repositories/auth_repo.dart';

import '../faliures/failures.dart';

class SignInUseCase {
  final AuthRepo authRepo;
  SignInUseCase(this.authRepo);
  Future<Either<Failure, UserCredential>> execute(
          String email, String password) =>
      authRepo.signIn(email, password);
}
