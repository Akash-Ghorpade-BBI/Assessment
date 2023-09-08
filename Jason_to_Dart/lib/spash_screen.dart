import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_assisment/home_screen.dart';
import 'package:json_assisment/lgin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}
String? finalEmail;

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getValidationData().whenComplete(()  async{
      Timer(Duration(seconds: 5), () {
        if(finalEmail== null){
          Navigator.pushNamed(
              context, 'home'
          );
        }
        else{
          Navigator.pushNamed(
          context, 'login');

              }
        // Navigator.pushNamed(
        //     context, 'login'
        // );
      }
      );
    });
  }
  Future getValidationData() async{
    final SharedPreferences sharedprefrance= await SharedPreferences.getInstance() ;
    var obtainEmail = sharedprefrance.getString("email");
    setState(() {
      finalEmail=obtainEmail;
    });
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
