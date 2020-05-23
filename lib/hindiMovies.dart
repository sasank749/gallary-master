import 'package:flutter/material.dart';

import './movieData.dart';
import './movie_details_screen.dart';

class HindiMovies extends StatelessWidget {
  final int index;
  HindiMovies(this.index);

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
              'id': hindiMovies[index].id,
              'title': hindiMovies[index].title,
              'imageUrl': hindiMovies[index].imageUrl,
              'description': hindiMovies[index].description,
              'rating': hindiMovies[index].rating,
              'year': hindiMovies[index].year,
              'duration': hindiMovies[index].duration,
              'cost' : hindiMovies[index].cost,
            },
          );
        },
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Hero(
                tag: hindiMovies[index].id,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(hindiMovies[index].imageUrl),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              hindiMovies[index].title,
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