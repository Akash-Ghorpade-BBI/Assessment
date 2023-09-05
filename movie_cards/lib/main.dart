import 'package:flutter/material.dart';
import 'package:movie_cards/movie.dart';

import 'package:movie_cards/netflix.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: netflix(),
    );

  }
}
