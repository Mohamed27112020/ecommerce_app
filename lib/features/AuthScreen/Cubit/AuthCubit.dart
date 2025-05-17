import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/uitls/Storage.dart';
import 'package:ecommerce_app/features/AuthScreen/Auth_models/Authmodel.dart';
import 'package:ecommerce_app/features/AuthScreen/Cubit/AuthStates.dart';
import 'package:ecommerce_app/features/AuthScreen/Repo_Auth/RepoAuth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  // username: "mor_2314", password: "83r5^_"
  void login({
    required String username,
    required String password,
    required BuildContext context,
  }) {
    emit(AuthLoadingState());
    Repoauth().login(username: username, password: password).then((
      Either<String, TokenModel> res,
    ) {
      res.fold(
        (error) {
          emit(AuthErrorState());
          print(error.toString());
        },
        (right) {
          Storagehelper().saveToken(right.token);

          emit(AuthSuccessState(right));
          print(right.toJson().toString());
          Navigator.pushNamed(context, '/Main');
        },
      );
    });
  }
}
