

import 'package:flutter/foundation.dart';




@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSignupState extends AuthenticationState {}

class AuthenticationSigninState extends AuthenticationState {}

class AuthenticationSigninToSignupState extends AuthenticationState {}