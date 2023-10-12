
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import '../../../../core/util/utility.dart';
import '../../../../injection_container.dart';
import '../../data/model/home_screen_guideline_model.dart' as modal;
import '../../data/repositories/home_screen_repository_impl.dart';
import '../bloc/home_screen_bloc.dart';
import '../widgets/display_guidelines.dart';

// import 'package:collection/collection.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: 'Json to UI');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // final nameprovider = Provider.of<UserName>(context);
    return Scaffold(
        appBar:
        AppBar(

          actions: <Widget>[
            TextButton(
              onPressed: () {},
              child: CupertinoSwitch(
                value: switchValue,
                onChanged: (bool value){
                  setState(() {
                    switchValue = value;
                  });
                  print(value);
                },
              ),

            ),

            TextButton(
              onPressed: () {},
              child:  ElevatedButton(
                onPressed: () async{
                  Navigator.pushNamed(context,'details');
                },
                child: const Text(
                  'Users Detils',
                  //style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),

            ),


          ],
        ),
        // body is the majority of the screen.
        body: FutureBuilder<List<modal.HomeScreenGuidelinesModel>>(
            future: sl<HomeScreenBloc>().callDecider(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child:
                  CircularProgressIndicator()
                ); // Show a loading indicator while data is being fetched.
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                listGuideLineModal = snapshot.data!;
                return DisplayGuideLines();
              }
            }));
  }
}