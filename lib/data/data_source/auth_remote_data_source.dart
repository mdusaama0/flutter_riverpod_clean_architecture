import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDataSource {
  Future<UserCredential> signIn(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserCredential> signIn(String email, String password) async {
    try {
      FirebaseAuth firebaseInstance = FirebaseAuth.instance;
      await firebaseInstance.currentUser?.reload();
      return await firebaseInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // throw ExistedAccountException();
        rethrow;
      } else if (e.code == 'wrong-password') {
        // throw WrongPasswordException();
        rethrow;
      } else {
        // throw ServerException();
        rethrow;
      }
    }
  }
}
