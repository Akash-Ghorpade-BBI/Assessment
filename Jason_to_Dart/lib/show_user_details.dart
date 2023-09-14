
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:json_assisment/home_screen.dart';
import 'package:json_assisment/main.dart';
import 'package:json_assisment/lgin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_assisment/spash_screen.dart';

import 'details_model.dart';

class ShowDetails extends StatefulWidget {
  const ShowDetails({super.key});
  @override
  State<ShowDetails> createState() => _ShowDetailsState();
}



class _ShowDetailsState extends State<ShowDetails> {
  // Future<void> getValidationData() async{
  //   final SharedPreferences sharedPreferences= await SharedPreferences.getInstance() ;
  //   var obtainEmail = sharedPreferences.getString("set_email");
  //   finalEmail=obtainEmail;
  //   print(finalEmail);
  // }


final updatedName=TextEditingController();

  Future getValidationData() async {
    final SharedPreferences sharedprefrance = await SharedPreferences
        .getInstance();
    var obtainEmail = sharedprefrance.getString("set_email");
    finalEmail = obtainEmail;

    // var obtainedName= sharedprefrance.getString("set_name");
    // finalName = obtainedName;

    //var allreadyEmail=sharedprefrance.getString("");
    // setState(() {
    //   finalEmail=obtainEmail;
    //   //UserEmail=allreadyEmail;
    // });

    // return finalEmail;

    print(finalEmail);
    //print(UserEmail);

  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getValidationData();
  }


  @override
  Widget build(BuildContext context) {
    final nameprovider= Provider.of<UserName>(context);
    return Scaffold(

        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(

                  child: Text(nameprovider.global_name.toString()),

              ),
              Container(


                child: Text('Email: $finalEmail'),

              ),
              SizedBox(

                height: 40,
              ),
              Row(children: [Text("You Can Update Your Name:")],),
              TextField(
                controller: updatedName,

                decoration: InputDecoration(

                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Update Name',
                    border: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(10)
                    )
                ),
                obscureText: true,
              ),
              ElevatedButton(
                onPressed: () async{


                  Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
                 // Navigator.of(context).pushAndRemoveUntil('login', (Route route) => false);
                },
                child: const Text(
                  'Remove',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              ElevatedButton(
                onPressed: () async{
                  nameprovider.changeName(updatedName.text);

                },
                child: const Text(
                  'Update Info',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ],
          ),
        ));
  }
}
