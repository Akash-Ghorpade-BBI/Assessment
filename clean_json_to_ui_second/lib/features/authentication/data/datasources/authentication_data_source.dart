import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/util/utility.dart';
import '../../../../main.dart';

abstract class AuthenticationDataSource {
  dynamic authenticationDataRemote();
  dynamic authenticationDataLocal();
}

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  AuthenticationDataSourceImpl({required this.sharedprefrance});
  late final SharedPreferences sharedprefrance;
  @override
  dynamic authenticationDataRemote() async {
    if (loginCredentialsApi.isEmpty) {
      final user_response = await read(Uri.parse(
          'https://s3.eu-west-1.amazonaws.com/bbi.appsdata.2013/for_development/user_details.json'));
      var loginCredentialsApi = json.decode(user_response);
      print(loginCredentialsApi);
      return loginCredentialsApi;
    } else {
      return loginCredentialsApi;
    }
  }

  @override
  dynamic authenticationDataLocal() async {
    sharedprefrance.setString('email', emailController.text);
    sharedprefrance.setString('name', nameController.text);
    sharedprefrance.setString('password', passwordController.text);
    print(sharedprefrance.getString('email'));
    print(sharedprefrance.getString('password'));

  }

}