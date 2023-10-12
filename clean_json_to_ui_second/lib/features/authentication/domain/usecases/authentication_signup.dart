import 'package:clean_architecture_of_json_assisment/features/authentication/data/model/authentication_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/authentication_repositoy.dart';

class AuthenticationRegister {
  AuthenticationRegister(this.repository);
  final AuthenticationRepository repository;

  @override
  Future<Either<Failure, dynamic>> call() async {
    return await repository.authenticationSignup();
  }
}