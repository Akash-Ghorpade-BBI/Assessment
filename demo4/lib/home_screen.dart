import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_bloc/new_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            const Text("HomeScreen"),
            TextButton(onPressed: (){
              BlocProvider.of<NewBloc>(context).loadTempScreen();
            },
              child: const Text("Next"),
            )
          ],
        ),
      ),
    );
  }
}