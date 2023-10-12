
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/util/utility.dart';
import '../../data/model/home_screen_guideline_model.dart';
import '../entities/home_screen_data.dart';
import '../repositories/home_screen_repository.dart';
import 'package:dartz/dartz.dart';

class HomeScreenOnlineData implements Usecase<HomeScreenGuidelinesModel> {
  HomeScreenOnlineData(this.repository);
  final HomeScreenRepository repository;

  @override
  Future<Either<Failure, List<HomeScreenGuidelinesModel>>> call() async {
    return await repository.homeScreenOnlineData(switchValue);
  }
}
// class Params extends Equatable {
//   final bool switchValue;
//
//   @override
//   Params({required this.switchValue});
//   // TODO: implement props
//   List<Object?> get props => throw UnimplementedError();
// }