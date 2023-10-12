
import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/util/utility.dart';
import '../../domain/repositories/home_screen_repository.dart';
import '../datasources/home_screen_local_data_source.dart';
import '../datasources/home_screen_remote_data_source.dart';
import '../model/home_screen_guideline_model.dart';

class HomeScreenRepositoryImpl implements HomeScreenRepository {
  HomeScreenRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  late final HomeScreenRemoteDataSource remoteDataSource;
  late final HomeScreenLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<HomeScreenGuidelinesModel>>> homeScreenOfflineData(
      switchValue) async {
    // TODO: implement homeScreenOfflineData
    return _getData();
  }

  @override
  Future<Either<Failure, List<HomeScreenGuidelinesModel>>> homeScreenOnlineData(
      switchValue) async {
    // TODO: implement homeScreenOnlineData
    return _getData();
  }

  Future<Either<Failure, List<HomeScreenGuidelinesModel>>> _getData() async {
    if (switchValue == false) {
      try {
        final localData = await localDataSource.homeScreenLocalData();
        return Right(localData);
      } on CacheException {
        return Left(CacheFailure());
      }
    } else if (switchValue == true) {
      try {
        final remoteData = await remoteDataSource.homeScreenRemoteData();
        return Right(remoteData);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Right(listGuideLineModal);
  }
}