import 'dart:async';

import 'package:flutter/material.dart';
import 'package:json_assisment/home_screen.dart';
import 'package:json_assisment/main.dart';
import 'package:json_assisment/lgin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_assisment/show_user_details.dart';
String? finalEmail;
class splash_screen extends StatefulWidget {

  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => splash_screenState();
}

String? UserEmail;


class splash_screenState extends State<splash_screen> {
  static const String KEYLOGIN= "login";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  //  whenComplete();
    getValidationData().whenComplete(()  async{
      var sharedPreferences=await SharedPreferences.getInstance();

      var isLoggedIn= sharedPreferences.getBool(KEYLOGIN);
      Timer(Duration(seconds: 5), () {
        if(isLoggedIn!=null){
          if(isLoggedIn){
            Navigator.pushReplacementNamed(context, 'home');

            // Navigator.pushNamed(context, 'home');
          }
          else{
            Navigator.pushReplacementNamed(context, 'login');
          }

        }
        else{
          Navigator.pushReplacementNamed(context, 'login');
        }
        // Navigator.pushNamed(context, 'login');
        // Navigator.pushNamed(
        //     context, 'login'
        // );
      });
    });
  }
  Future getValidationData() async{
    final SharedPreferences sharedprefrance= await SharedPreferences.getInstance() ;
    var obtainEmail = sharedprefrance.getString("set_email");
    finalEmail=obtainEmail;
    print(finalEmail);
    //var allreadyEmail=sharedprefrance.getString("set_email");
    // setState(() {
    //   finalEmail=obtainEmail;
    //   //UserEmail=allreadyEmail;
    // });

   // print(UserEmail);

  }

 // void  whenComplete() async{
    // var sharedpref=await SharedPreferences.getInstance();
    // var isLoggedIn= sharedpref.getBool("KEYLOGIN");
    // Timer(Duration(seconds: 5), () {
    //   if(isLoggedIn!=null){
    //     if(isLoggedIn==true){
    //       Navigator.pushNamed(context, 'home');
    //
    //       // Navigator.pushNamed(context, 'home');
    //     }
    //     else{
    //       Navigator.pushNamed(context, 'login');
    //     }
    //
    //   }
    //   else{
    //     Navigator.pushNamed(context, 'login');
    //   }
    //   // Navigator.pushNamed(context, 'login');
    //   // Navigator.pushNamed(
    //   //     context, 'login'
    //   // );
    // });
  //}

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




// if(finalEmail== UserEmail){
//   Navigator.pushNamed(
//       context, 'home'
//   );
// }
// else{
//   Navigator.pushNamed(
//   context, 'login');
//
//}