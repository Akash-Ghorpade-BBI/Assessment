
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../features/home_screen/domain/entities/home_screen_data.dart';
import '../error/failures.dart';

abstract class Usecase<Type> {
  Future<Either<Failure, List<HomeScreenData>>> call();
}

class NoParams extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}