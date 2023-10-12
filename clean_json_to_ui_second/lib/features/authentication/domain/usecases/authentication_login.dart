import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/authentication_model.dart';
import '../repositories/authentication_repositoy.dart';

class AuthenticationLogin {
  AuthenticationLogin(this.repository);
  final AuthenticationRepository repository;

  @override
  Future<Either<Failure, dynamic>> call() async {
    return await repository.authenticationLogin();
  }
}