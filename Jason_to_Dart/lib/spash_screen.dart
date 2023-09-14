import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_assisment/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
String? finalEmail;
class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => splash_screenState();
}

class splash_screenState extends State<splash_screen> {
  static const String KEYLOGIN= "login";

  @override
  void initState() {
    super.initState();

    getValidationData().whenComplete(()  async{
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      var isLoggedIn= sharedPreferences!.getBool(KEYLOGIN);
      Timer(Duration(seconds: 3), () {
        if(isLoggedIn!=null){
          if(isLoggedIn){
            Navigator.pushReplacementNamed(context, 'home');

          }
          else{
            Navigator.pushReplacementNamed(context, 'login');
          }

        }
        else{
          Navigator.pushReplacementNamed(context, 'login');
        }

      });
    });
  }
  Future getValidationData() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var obtainEmail = sharedPreferences!.getString("set_email");
    finalEmail=obtainEmail;
    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
            child: Text(
          "Welcome..",
          style: TextStyle(
              fontSize: 34, color: Colors.white, fontWeight: FontWeight.w700),
        )),
      ),
    );
  }
}
