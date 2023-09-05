import 'package:flutter/material.dart';

class netflix extends StatefulWidget {
  const netflix({super.key});

  @override
  State<netflix> createState() => _Netflix();
}

class _Netflix extends State<netflix> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar:AppBar(
          title: Text('One_Two_Three'),
          backgroundColor : Colors.black12,
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed:(){},
          ),
        ),

        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
              children: <Widget>[
                Container(

                    child: Row(
                      children: [

                        Container(
                          height: 125,
                          width: 200,
                          decoration: const BoxDecoration(
                              color: Colors.blue,

                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage("https://static.themoscowtimes.com/image/article_1360/95/nacosKopie.JPG"),
                              )
                          ),

                        ),

                        Container(
                          height: 125,
                          width: 200,
                          decoration: const BoxDecoration(
                              color: Colors.blue,

                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage("https://images-na.ssl-images-amazon.com/images/S/pv-target-images/4b35a02dfd530e90df2a80f49ed9771dacb35ac630d0666808ee9f739f661114._UY500_UX667_RI_TTW_.jpg"),
                              )
                          ),

                        ),

                        Container(
                          height: 125,
                          width: 200,
                          decoration: const BoxDecoration(
                              color: Colors.blue,

                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage("https://moderndiplomacy.eu/wp-content/uploads/2021/10/squid-game-rules-1000x600.jpg"),
                              )
                          ),

                        ),

                      ],
                    )
                ),

                Container(

                ),

              ]
          ),
        )

    );
  }
}