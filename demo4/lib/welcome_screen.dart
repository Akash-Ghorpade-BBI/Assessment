import 'package:demo4/my_bloc/new_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            const Center(child: Text("WelcomeScreen")),
            TextButton(onPressed: (){
              BlocProvider.of<NewBloc>(context).loadHomeScreen();
            },
              child: const Text("Next"),
            )
          ],
        ),
      ),
    );
  }
}