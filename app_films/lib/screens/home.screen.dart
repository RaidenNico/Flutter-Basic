import 'package:app_films/providers/movie.provider.dart';
import 'package:app_films/widgets/imports/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../search/search.delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // listem: false -> no
    final MoviesProvider movieProvider = Provider.of<MoviesProvider>(context);

    //print(movieProvider.onDisplayMobies);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Peliculas en cines'),
          elevation: 0,
          actions: [
            IconButton(
                icon: const Icon(Icons.search_outlined),
                onPressed: () => showSearch(
                    context: context, delegate: MovieSearchDelegate()))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Card main
              CardSwiperWidget(movies: movieProvider.onDisplayMobies),
              // Slider films
              MovieSliderWidget(
                title: 'Populares',
                movies: movieProvider.popularMovies,
                onNextPage: () => movieProvider.getPopularMovies(),
              )
            ],
          ),
        ));
  }
}
