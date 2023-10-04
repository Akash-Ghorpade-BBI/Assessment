part of 'new_bloc.dart';

@immutable
abstract class NewEvent {}

class HomeEvent extends NewEvent{}

class WelcomeEvent extends NewEvent{}

class TempEvent extends NewEvent{}
