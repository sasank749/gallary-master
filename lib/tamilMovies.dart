import 'package:flutter/material.dart';

import './movieData.dart';
import './movie_details_screen.dart';

class tamilMovies extends StatelessWidget {
  final int index;
  tamilMovies(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 160,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            MovieDetailsScreen.routeName,
            arguments: {
              'id': TamilMovies[index].id,
              'title': TamilMovies[index].title,
              'imageUrl': TamilMovies[index].imageUrl,
              'description': TamilMovies[index].description,
              'rating': TamilMovies[index].rating,
              'year': TamilMovies[index].year,
              'duration': TamilMovies[index].duration,
              'cost' : TamilMovies[index].cost,
            },
          );
        },
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Hero(
                tag: TamilMovies[index].id,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(TamilMovies[index].imageUrl),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              TamilMovies[index].title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}