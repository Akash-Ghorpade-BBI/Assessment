import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:json_assisment/home_screen.dart';
import 'package:json_assisment/lgin_screen.dart';
import 'package:json_assisment/show_user_details.dart';
import 'package:json_assisment/sign_up.dart';
import 'package:json_assisment/spash_screen.dart';
import 'guideline_model.dart';
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
     initialRoute:'splash',
     routes: {
      'login': (context) => LoginScreen(),
       'home': (context) =>MyAppState(),
       'splash': (context) =>splash_screen(),
       'signup':(context)=>SignUpScreen(),
       'details':(context)=>ShowDetails(),
     },
  ));
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // initialRoute:'Login',
//       // routes: {},
//       home: splash_screen(),
//     );
//   }
// }
//MyAppState()