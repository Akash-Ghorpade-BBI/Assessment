import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_event.dart';
part 'new_state.dart';

class NewBloc extends Bloc<NewEvent, NewState> {
  NewBloc() : super(NewInitial()) {
    on<NewEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<HomeEvent>((event, emit) {
      emit(HomeState());
    });
    on<WelcomeEvent>((event, emit) {
      emit(WelcomeState());
    });
    on<TempEvent>((event, emit) {
      emit(TempState());
    });
  }

  loadHomeScreen(){
    add(HomeEvent());
  }

  loadTempScreen(){
    add(TempEvent());
  }

  loadWelcomeScreen(){
    add(WelcomeEvent());
  }

}
