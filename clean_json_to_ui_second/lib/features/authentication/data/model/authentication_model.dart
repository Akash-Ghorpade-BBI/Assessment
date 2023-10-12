import '../../domain/entities/authentication_entity.dart';

class UserdataEntityModel extends  UserdataEntity {
  UserdataEntityModel({
    String? email,
    String? password,
    String? name,
  }) : super(email: email, password: password, name: name);
  factory UserdataEntityModel.fromJson(Map<String, dynamic> json) {
    return UserdataEntityModel(
      email: json['email'],
      password: json['password'],
      name: json['name'],
    );

  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    return data;
  }



}