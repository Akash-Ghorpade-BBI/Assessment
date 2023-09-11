import 'package:flutter/material.dart';
import 'package:json_assisment/home_screen.dart';
import 'package:json_assisment/spash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController2 = TextEditingController();
  String? finalEmail;
  bool? isChecked=false;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Navigator.pushReplacement(
  //       context, MaterialPageRoute(
  //       builder: (context) => MyAppState()
  //   )
  //   );
  //
  //
  // }

  Future getValidationData() async{
    final SharedPreferences sharedprefrance= await SharedPreferences.getInstance() ;
    var obtainEmail = sharedprefrance.getString("set_email");
    //var allreadyEmail=sharedprefrance.getString("");
    setState(() {
      finalEmail=obtainEmail;
      //UserEmail=allreadyEmail;
    });
    print(finalEmail);
    //print(UserEmail);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 100, 10, 100),
              child: Column(
                children: [
                  Text(
                    "Login Page",
                    style: TextStyle(
                        fontSize: 34, color: Colors.green, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  TextField(
                    controller: emailController2,
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
                            setState(()async {
                              isChecked= newBool;
                              SharedPreferences sharedPreferences= await SharedPreferences.getInstance() ;
                              sharedPreferences.setBool(splash_screenState.KEYLOGIN, isChecked!);
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
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, 'signup'
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
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
                            // Navigator.pushNamed(
                            //     context, 'register'
                            // );
                            SharedPreferences sharedprefrance= await SharedPreferences.getInstance() ;
                            sharedprefrance.setString('user_entered_email', emailController2.text);


                            getValidationData().whenComplete(() => {
                            if(finalEmail==emailController2.text){
                                Navigator.pushReplacementNamed(context, 'home')
                          }
                            else{
                                showDialog(
                                context: context,
                                builder: (BuildContext context)
                                {
                                  return const AlertDialog(
                                    title: Text("Email Not Valid"),
                                  );
                                }//builder

                            )
                            }
                            });


                            print(isChecked);

                          },
                          child: const Text(
                            'Log In',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
