import 'package:flutter/material.dart';

import './movieData.dart';
import './movie_details_screen.dart';

class EnglishMovies extends StatelessWidget {
  final int index;
  EnglishMovies(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {

            Navigator.of(context).pushNamed(
              MovieDetailsScreen.routeName,
              arguments: {
                'id': englishMovieList[index].id,
                'title': englishMovieList[index].title,
                'imageUrl': englishMovieList[index].imageUrl,
                'description': englishMovieList[index].description,
                'rating': englishMovieList[index].rating,
                'year': englishMovieList[index].year,
                'duration': englishMovieList[index].duration,
                'cost' : englishMovieList[index].cost,
              },
            );
          },
          child: Card(
            elevation: 5,
            child: Row(
              children: <Widget>[
                Hero(
                  tag: englishMovieList[index].id,

                  child: Container(

                    height: 150,
                    width: 72,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5),
                      ),

                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          englishMovieList[index].imageUrl,
                        ),
                      ),
                    ),

                  ),
                ),
                Container(

                  padding: const EdgeInsets.all(10),


                  height: 150,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(

                        englishMovieList[index].title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 240,
                        child: Text(
                          englishMovieList[index].description,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,

        ),
      ],
    );
  }
}