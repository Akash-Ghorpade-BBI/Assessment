import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:json_assisment/details_model.dart';
import 'package:json_assisment/home_screen.dart';
import 'package:json_assisment/lgin_screen.dart';
import 'package:json_assisment/show_user_details.dart';
import 'package:json_assisment/sign_up.dart';
import 'package:json_assisment/spash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'guideline_model.dart';
// SharedPreferences? sharedPreferences;
void main() async{
  runApp(const MyApp());
  // sharedPreferences=await SharedPreferences.getInstance();
  //WidgetsFlutterBinding.ensureInitialized();
 // runApp(const MyApp());
  //runApp();
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create: (_) => UserName(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        initialRoute:'splash',
        routes: {
          'login': (context) => LoginScreen(),
          'home': (context) =>MyAppState(),
          'splash': (context) =>splash_screen(),
          'signup':(context)=>SignUpScreen(),
          'details':(context)=>ShowDetails(),
        },

      ),
    );
  }
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


