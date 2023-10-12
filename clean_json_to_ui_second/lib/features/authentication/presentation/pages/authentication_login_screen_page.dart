import 'dart:convert';

import 'package:clean_architecture_of_json_assisment/core/util/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

import '../../../../injection_container.dart';
import '../bloc/authentication_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}



class _LoginScreenState extends State<LoginScreen> {
  // final emailController2 = TextEditingController();
  // final emailController3 = TextEditingController();
  // String? finalEmail;
  // String? finalNameset;
  // bool? isChecked=false;
  // bool? newBool;
  // List<modal.Userdata> user_list = [];
  // var mail1;
  // var pass;
  // Map< String, dynamic>? user_list1 ={};

  // Future loadUserJson() async {
  //   final userdata1 =await http.get(Uri.parse('https://s3.eu-west-1.amazonaws.com/bbi.appsdata.2013/for_development/user_details.json'));
  //   user_list1 =  json.decode(userdata1.body);
  // }


  // Future getValidationData() async{
  //   SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
  //   var obtainEmail = sharedPreferences!.getString("set_email");
  //   var obtainedname = sharedPreferences.getString("set_name");
  //   setState(() {
  //     finalNameset=obtainedname;
  //     finalEmail=obtainEmail;
  //   });
  //   print(finalEmail);
  //   print(finalNameset);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 100, 10, 100),
          child: Column(
            children: [
              const Text(
                "Login Page",
                style: TextStyle(
                    fontSize: 34, color: Colors.green, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 40,
              ),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),

              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(

                    child: Checkbox(
                      value: isChecked,
                      activeColor: Colors.green,

                      onChanged: (newBool){
                        // isChecked=true;
                        Future<dynamic> cheCked() async {
                          await sharedprefrance!
                              .setBool('checkbox', isChecked!);
                        }
                        setState(() {
                          isChecked=newBool!;
                          cheCked();
                        });

                      },

                    ),

                  ),
                  Text('Remember Me'),

                ],
              ),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 17),
                       // style: TextStyle(color: Colors.black, fontSize: 25,backgroundColor: Colors.grey),
                      ),
                      onPressed: () async{
                        BlocProvider.of<AuthenticationBloc>(context)
                            .loadSigninToSignupScreen();
                      },
                    ),
                  ),
                  Container(width: 20,),
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                      onPressed: () async{

                        print(decision);
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  title: Text("Provide All Details"),
                                );
                              });
                        }
                        await sl<AuthenticationBloc>()
                            .callAuthenticationSignIn();

                        print(decision);
                        print(decision);
                        if (decision == false) {
                          emailController.clear();
                          nameController.clear();
                          passwordController.clear();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  title: Text("Enter Valid Details"),
                                );
                              });
                        } else if (decision == true) {
                          emailController.clear();
                          nameController.clear();
                          passwordController.clear();
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => HomeScreenPage()),
                          // );
                          BlocProvider.of<AuthenticationBloc>(context)
                              .loadSigninScreen();
                        }
                      },
                      child: const Text(
                        'Log On ',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                            fontSize: 17),
                        // style: TextStyle(color: Colors.black, fontSize: 25,backgroundColor: Colors.grey),

                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
