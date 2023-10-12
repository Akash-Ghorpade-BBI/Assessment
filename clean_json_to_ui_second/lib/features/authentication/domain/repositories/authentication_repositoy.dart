
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/authentication_model.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, dynamic>> authenticationLogin();
  Future<Either<Failure, dynamic>> authenticationSignup();
}
