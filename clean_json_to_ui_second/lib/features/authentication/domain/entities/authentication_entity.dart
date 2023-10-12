import 'package:equatable/equatable.dart';

class UserdataEntity extends Equatable {
  String? email;
  String? password;
  String? name;

  UserdataEntity({this.email, this.password, this.name});

  @override
  List<Object?> get props => [email, password, name];
}