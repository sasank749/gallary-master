import 'package:flutter/material.dart';
import './movie_details_screen.dart';

import './movieData.dart';

class teluguMovies extends StatelessWidget {
  final int index;
  teluguMovies(this.index);

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
              'id': TeluguMovies[index].id,
              'title': TeluguMovies[index].title,
              'imageUrl': TeluguMovies[index].imageUrl,
              'description': TeluguMovies[index].description,
              'rating': TeluguMovies[index].rating,
              'year': TeluguMovies[index].year,
              'duration': TeluguMovies[index].duration,
              'cost' : TeluguMovies[index].cost,
            },
          );
        },
        child: Column(
          children: <Widget>[
            Card(
              elevation: 10,
              child: Hero(
                tag: TeluguMovies[index].id,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(TeluguMovies[index].imageUrl),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              TeluguMovies[index].title,
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