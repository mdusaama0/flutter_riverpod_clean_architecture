import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../faliures/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserCredential>> signIn(String email, String password);
}
