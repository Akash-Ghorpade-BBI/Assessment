import 'package:flutter/material.dart';
import 'package:movie_cards/movie.dart';
class netflix extends StatefulWidget {
  const netflix({super.key});

  @override
  State<netflix> createState() => _Netflix();
}

class _Netflix extends State<netflix> {
  int selectedContainerIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(
        title: Text('One_'),
        backgroundColor : Colors.black12,
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Menu',
          onPressed:(){},
        ),
      ),
      body: Column(
        children: [

          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(


              itemCount: movieList.length,
              itemBuilder: (context,index){
                Movie movie=movieList[index];
             return GestureDetector(

               onTap: (){
                 setState(() {
                   selectedContainerIndex = index;

                 });
               },

               child: Container(
                    height: 400,
                    width: 200,
                    child: Column(

                      children: [
                        Image.network(movie.imageURL),
                        Text(movie.title),
                      ],
                    ),
                  ),
             );
               // return Container(child: Text(movie.title),);
              },
              scrollDirection: Axis.horizontal,


            ),
          ),

          Container(
            height: 150,
            padding: const EdgeInsets.all(10),
            color: Colors.black,
            child: Center(
              child: Text(
                movieList[selectedContainerIndex].title,
                style: TextStyle(
                  color: Colors.red
                ),

              ),
            ),
          )

        ]
    ));


  }
}
