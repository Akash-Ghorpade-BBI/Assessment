import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/util/utility.dart';
import '../../../../injection_container.dart';
import '../bloc/authentication_bloc.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}


class _SignUpScreenState extends State<SignUpScreen> {
  //Future<SharedPreferences> sharedprefrance=  SharedPreferences.getInstance() ;
  // final emailController = TextEditingController();
  // final nameController=TextEditingController();

  @override
  Widget build(BuildContext context) {
   // final nameprovider= Provider.of<UserName>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(

          padding: const EdgeInsets.fromLTRB(10, 100, 10, 100),
          child: Column(

            children: [
              const Text(
                "Signup Page",
                style: TextStyle(
                    fontSize: 34, color: Colors.red, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 40,
              ),
              TextField(

                controller: nameController,
                decoration: InputDecoration(

                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Enter Your Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),

              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(

                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Enter Your Email ID',
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
                    hintText: 'Set 8 Digit Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
                obscureText: true,
              ),
              const  SizedBox(
                height: 40,
              ),

              Row(
                children: [
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.red, borderRadius: BorderRadius.circular(20)),
                    child: ElevatedButton(
                      onPressed: () async{
                        // Navigator.pushNamed(
                        //     context, 'register'
                        // );
                        String patternPassword =
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                        RegExp regExpPassword = RegExp(patternPassword);
                        String patternEmail =
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                        RegExp regExpEmail = RegExp(patternEmail);


                        if (regExpPassword
                            .hasMatch(passwordController.text) ==
                            false) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  title: Text(
                                      "password must be 8 character with Cap,small,numeric,special char"),
                                );
                              });
                        } else if (regExpEmail
                            .hasMatch(emailController.text) ==
                            false) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  title: Text("Email is not valid"),
                                );
                              });
                        } else if (nameController.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const AlertDialog(
                                  title: Text("Please enter name"),
                                );
                              });
                        }
                        else {

                          sl<AuthenticationBloc>()
                              .callAuthenticationSignUp();
                          emailController.clear();
                          nameController.clear();
                          passwordController.clear();
                          BlocProvider.of<AuthenticationBloc>(context)
                              .loadSignupScreen();
                        }

                        //   showDialog(context: context,builder: (BuildContext context)
                        // {return const AlertDialog(title: Text("Email is not valid"),

                        // Navigator.pushReplacementNamed(context,'login' );
                      },
                      child: const Text(
                        'Sign Up',
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
