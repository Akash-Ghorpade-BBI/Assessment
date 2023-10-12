import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/util/utility.dart';
import '../../data/model/home_screen_guideline_model.dart';
import '../../domain/usecases/home_screen_offline_data.dart';
import '../../domain/usecases/home_screen_online_data.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  late HomeScreenOfflineData homeScreenOfflineData;
  late HomeScreenOnlineData homeScreenOnlineData;
  HomeScreenBloc(
      {required this.homeScreenOnlineData, required this.homeScreenOfflineData})
      : super(HomeScreenInitial()) {
    on<HomeScreenEvent>((event, emit) => (HomeScreenInitial()));
  }
  Future<List<HomeScreenGuidelinesModel>> callDecider() async {
    if (switchValue == false) {
      await homeScreenOfflineData();
    }

    if (switchValue == true) {
      await homeScreenOnlineData();
    }
    return listGuideLineModal;
  }
}