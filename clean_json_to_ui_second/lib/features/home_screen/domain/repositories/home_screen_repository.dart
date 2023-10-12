
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/home_screen_guideline_model.dart';

abstract class HomeScreenRepository {
  Future<Either<Failure, List<HomeScreenGuidelinesModel>>> homeScreenOfflineData(
      switchValue);
  Future<Either<Failure, List<HomeScreenGuidelinesModel>>> homeScreenOnlineData(
      switchValue);
}