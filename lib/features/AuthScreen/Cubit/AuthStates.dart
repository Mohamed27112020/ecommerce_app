import 'package:ecommerce_app/features/AuthScreen/Auth_models/Authmodel.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class AuthSuccessState extends AuthStates {
  late  TokenModel tokenModel;
  AuthSuccessState(this.tokenModel);
}

class AuthErrorState extends AuthStates {}

class AuthLogoutState extends AuthStates {}
