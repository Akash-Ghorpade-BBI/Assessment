import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class UserName with ChangeNotifier{
  String? global_name;

  void changeName(String new_name){
    global_name=new_name;
    notifyListeners();
  }
}
// class ChangeNotifier{
//   String _users_name;
//   ChangeNotifier(this._users_name);
//
//   String get usersname=> _users_name;
// }