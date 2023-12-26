import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hey_flutter_task/core/routes/app_router.dart';
import 'package:hey_flutter_task/core/utils/app_prompts.dart';
import 'package:hey_flutter_task/data/data_source/auth_remote_data_source.dart';
import 'package:hey_flutter_task/data/repositories/auth_repo_imp.dart';
import 'package:hey_flutter_task/presentation/pages/login_screen.dart';
import 'package:hey_flutter_task/presentation/pages/profile_screen.dart';
import 'package:hey_flutter_task/presentation/pages/sign_up_screen.dart';

import '../../domain/entities/sign_in_entity.dart';
import '../../domain/entities/sign_up_entity.dart';
import '../../domain/usecases/auth_usecases.dart';

//global instance for auth provider
final authProvider = ChangeNotifierProvider.autoDispose(
  (ref) => AuthProvider(),
);

class AuthProvider extends ChangeNotifier {
  //auth usecase instances
  final SignInUseCase _signInUseCase =
      SignInUseCase(AuthRepoImp(AuthRemoteDataSourceImpl()));
  final SignUpUseCase _signUpUseCase =
      SignUpUseCase(AuthRepoImp(AuthRemoteDataSourceImpl()));
  final UserExistUseCase _userExistUseCase =
      UserExistUseCase(AuthRepoImp(AuthRemoteDataSourceImpl()));
  bool loader = false; //state varible for loading state

  AuthProvider();

  Future<void> signIn(SignInEntity signInEntity) async {
    loader = true;
    notifyListeners();
    //calling the signin usecase
    final result = await _signInUseCase.execute(signInEntity);

    loader = false;
    notifyListeners();

    //utilizing dartz package for error handling
    //on faliure prompt the error message
    //on success navigating to profile screen with user details
    result.fold(
      (failure) {
        Prompt.showSnackBar(failure.message);
      },
      (userCredential) {
        AppRouter.pushAndRemoveUntil(ProfileScreen(
          user: userCredential,
        ));
      },
    );
  }

  Future<void> signUp(SignUpEntity signUpEntity) async {
    loader = true;
    notifyListeners();
    //calling the signup usecase
    final result = await _signUpUseCase.execute(signUpEntity);

    loader = false;
    notifyListeners();

    //utilizing dartz package for error handling
    //on faliure prompt the error message
    //on success navigating to profile screen with user details
    result.fold(
      (failure) {
        Prompt.showSnackBar(failure.message);
      },
      (user) {
        AppRouter.pushAndRemoveUntil(ProfileScreen(
          user: user,
        ));
      },
    );
  }

  Future<void> checkUserExistence(String email) async {
    loader = true;
    notifyListeners();

    final result = await _userExistUseCase.execute(email);
    loader = false;
    notifyListeners();

    //utilizing dartz package for error handling
    //on faliure prompt the error message
    //on success navigating to login screen if user exist and on signup screen if doesn't exist
    result.fold(
      (failure) {
        Prompt.showSnackBar(failure.message);
      },
      (user) {
        if (user != null) {
          AppRouter.push(LoginScreen(user: user));
        } else {
          AppRouter.push(SignuUpScreen(email: email));
        }
      },
    );
  }
}
