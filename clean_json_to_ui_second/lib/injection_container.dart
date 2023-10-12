
import 'package:clean_architecture_of_json_assisment/features/authentication/domain/usecases/authentication_login.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/network_info.dart';
import 'core/util/utility.dart';
import 'features/authentication/data/datasources/authentication_data_source.dart';
import 'features/authentication/data/repositories/authentication_repository_impl.dart';
import 'features/authentication/domain/repositories/authentication_repositoy.dart';
import 'features/authentication/domain/usecases/authentication_signup.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/home_screen/data/datasources/home_screen_local_data_source.dart';
import 'features/home_screen/data/datasources/home_screen_remote_data_source.dart';
import 'features/home_screen/data/repositories/home_screen_repository_impl.dart';
import 'features/home_screen/domain/repositories/home_screen_repository.dart';
import 'features/home_screen/domain/usecases/home_screen_offline_data.dart';
import 'features/home_screen/domain/usecases/home_screen_online_data.dart';
import 'features/home_screen/presentation/bloc/home_screen_bloc.dart';

// Service Locator
final sl = GetIt.instance;

Future<void> init() async {
  //! homescreen
  sl.registerFactory(
        () => HomeScreenBloc(
      homeScreenOfflineData: sl(),
      homeScreenOnlineData: sl(),
    ),
  );


  // auth
  sl.registerFactory(
        () => AuthenticationBloc(
      authenticationLogin: sl(),
      authenticationRegister: sl(),
    ),
  );

  // homecsreen repo
  sl.registerLazySingleton(() => HomeScreenOfflineData(sl()));
  sl.registerLazySingleton(() => HomeScreenOnlineData(sl()));

  sl.registerLazySingleton(() => AuthenticationLogin(sl()));
  sl.registerLazySingleton(() => AuthenticationRegister(sl()));


  // HOMESCREENRepository


  sl.registerLazySingleton<HomeScreenRepository>(
        () => HomeScreenRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );
  //AUTH REPO

  sl.registerLazySingleton<AuthenticationRepository>(
          () => AuthenticationRepositoryImpl(dataSource: sl()));


  //homescreen Data sources
  sl.registerLazySingleton<HomeScreenRemoteDataSource>(
        () => HomeScreenRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<HomeScreenLocalDataSource>(
        () => HomeScreenLocalDataSourceImpl(),
  );
  //AUTH data siucres
  sl.registerLazySingleton<AuthenticationDataSource>(
          () => AuthenticationDataSourceImpl(sharedprefrance: sl()));
  sharedprefrance = await SharedPreferences.getInstance();
  sl.registerSingletonAsync(() async => sharedprefrance);

}