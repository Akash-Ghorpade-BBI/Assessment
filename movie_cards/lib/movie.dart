import 'package:flutter/material.dart';

class Movie {
  String title;
  String description;
  String imageURL;

  Movie(

      {required this.title,
  required this.description,
  required this.imageURL}


      );

}

List<Movie> movieList =[
  Movie(
    title: 'Game Of Throns',
    description: 'good movie',
   imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBmghKoGwBBtm4_noYUy6JryXcgWCElXqVlSXRkS0e0dTHO8Mi6DwQ7xaDHb-01cj7AOE&usqp=CAU"
   // imageURL: "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/4b35a02dfd530e90df2a80f49ed9771dacb35ac630d0666808ee9f739f661114._UY500_UX667_RI_TTW_.jpg"
  ),
  Movie(
      title: 'Vikings: Valhala',
      description: 'good movie',
      imageURL: "https://images.wallpapersden.com/image/wxl-vikings-hd_79820.jpg"
  ),
  Movie(
      title: 'nadd',
      description: 'Pairets Of The Caribbean',
      imageURL: "https://prod-ripcut-delivery.disney-plus.net/v1/variant/disney/C6AB0EDCE8F41882EBBB782B76DD4F05D7E360D7C3F23B4F6D02C24699B26105/scale?width=1200&aspectRatio=1.78&format=jpeg"
      //imageURL: "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/4b35a02dfd530e90df2a80f49ed9771dacb35ac630d0666808ee9f739f661114._UY500_UX667_RI_TTW_.jpg"

  ),
  Movie(
      title: 'MI5',
      description: 'good movie',
      imageURL: "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/b1dda6035e51b13c917df4d747f8a36e52394c5dff2f27e18d001bd87537ce75._UY500_UX667_RI_TTW_.jpg"
      //imageURL: "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/4b35a02dfd530e90df2a80f49ed9771dacb35ac630d0666808ee9f739f661114._UY500_UX667_RI_TTW_.jpg"
  ),
];
