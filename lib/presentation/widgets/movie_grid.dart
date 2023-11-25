import 'package:flutter/material.dart';
import 'package:moviemingle/constants/constants.dart';

import '../../data/models/movies.dart';
import '../screens/DetailsScreen/detalis_screen.dart';

class MovieGrid extends StatelessWidget {
  const MovieGrid({super.key, required this.movies});

  final List<Movies> movies;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: movies.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3 / 4,
          mainAxisSpacing: 15,
          crossAxisSpacing: 10),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return DetailsScreen(
                    movie: movies[index],
                  );
                },
              ),
            );
          },
          child: movies[index].mediumImg == null
              ? Image.asset(Constants.noImg1,height: 100,fit: BoxFit.cover,)
              : Hero(
                  tag: movies[index].id,
                  child: Image.network(movies[index].mediumImg!)),
        );
      },
    );
  }
}
