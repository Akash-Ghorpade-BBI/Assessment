import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../../../core/util/utility.dart';
import '../../domain/usecases/authentication_login.dart';
import '../../domain/usecases/authentication_signup.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  late AuthenticationLogin authenticationLogin;
  late AuthenticationRegister authenticationRegister;
  AuthenticationBloc(
      {required this.authenticationLogin, required this.authenticationRegister})
      : super(AuthenticationInitial()) {
    on<AuthenticationSignupEvent>(
            (event, emit) => emit(AuthenticationSignupState()));

    on<AuthenticationSigninToSignupEvent>(
            (event, emit) => emit(AuthenticationSigninToSignupState()));

    on<AuthenticationSigninEvent>(
            (event, emit) => emit(AuthenticationSigninState()));
  }
  loadSigninScreen() {
    add(AuthenticationSigninEvent());
  }

  loadSignupScreen() {
    add(AuthenticationSignupEvent());
  }

  loadSigninToSignupScreen() {
    add(AuthenticationSigninToSignupEvent());
  }

  dynamic callAuthenticationSignIn() async {
    await authenticationLogin();
    return decision;
  }

  dynamic callAuthenticationSignUp() async {
    await authenticationRegister();
    return login_credentails;
  }
}