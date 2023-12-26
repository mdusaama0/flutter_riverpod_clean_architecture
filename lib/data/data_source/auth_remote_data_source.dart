import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hey_flutter_task/data/models/user_model.dart';
import 'package:hey_flutter_task/domain/entities/sign_in_entity.dart';

import '../../domain/entities/sign_up_entity.dart';
import '../../domain/exceptions/exceptions.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel?> signIn(SignInEntity signInEntity);
  Future<UserModel?> signUp(SignUpEntity signUpEntity);
  Future<UserModel?> isUserExist(String email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  //Firebase auth instance
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<UserModel?> signIn(SignInEntity signInEntity) async {
    try {
      //sign in method from firebase auth
      final credentials = await auth.signInWithEmailAndPassword(
        email: signInEntity.email,
        password: signInEntity.password,
      );

      //getting the user details from firestore
      return getUserDetail(credentials.user!.email!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw ExistedAccountException(e.message!);
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordException(e.message!);
      } else {
        throw ServerException(e.message!);
      }
    }
  }

  @override
  Future<UserModel?> isUserExist(String email) async {
    try {
      //check if the user exist with entered email
      final check = await auth.fetchSignInMethodsForEmail(email);
      if (check.isNotEmpty) {
        //this will return the user details from firestore if exist
        return getUserDetail(email);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel?> signUp(SignUpEntity signUpEntity) async {
    //user collection instance from firestore
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    try {
      //creating user from firebase auth method
      final credentials = await auth.createUserWithEmailAndPassword(
        email: signUpEntity.email,
        password: signUpEntity.password,
      );

      //adding user details to firestore i-e name, email & profile pic
      await users.add({
        'name': signUpEntity.name,
        'email': signUpEntity.email,
        'profile_pic': signUpEntity.profilePic,
      });

      //return the created user
      return UserModel(
        email: credentials.user!.email!,
        name: signUpEntity.name,
        profile: signUpEntity.profilePic,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeekPassException(e.message!);
      } else if (e.code == 'email-already-in-use') {
        throw ExistedAccountException(e.message!);
      } else {
        throw ServerException(e.message!);
      }
    }
  }

  Future<UserModel?> getUserDetail(String email) async {
    try {
      //getting the details of the user from firestore of entered email
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      //returning the user details if exist
      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> userData =
            querySnapshot.docs.first.data() as Map<String, dynamic>;
        return UserModel.fromMap(userData);
      } else {
        throw NoUserException('User details not found');
      }
    } catch (e) {
      throw NoUserException('User details not found');
    }
  }
}
