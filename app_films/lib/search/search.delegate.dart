import 'package:app_films/models/imports/models.dart';
import 'package:app_films/providers/movie.provider.dart';
import 'package:app_films/routers/app.routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) return _emptyContainer();

    return const Text('buildResults');
  }

  Widget _emptyContainer() {
    return Container(
      child: const Center(
          child: Icon(
        Icons.movie_creation_outlined,
        color: Colors.black38,
        size: 100,
      )),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _emptyContainer();
    }

    //print('http request');

    final moviesProviders = Provider.of<MoviesProvider>(context);
    moviesProviders.getSuggestionsByQuery(query);

    return StreamBuilder(
      stream: moviesProviders.sugestionStream,
      builder: (_, AsyncSnapshot<List<MovieResponse>> snapshot) {
        if (!snapshot.hasData) return _emptyContainer();
        final List<MovieResponse> movies = snapshot.data!;
        return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (_, int index) => _MovieItem(
                  movie: movies[index],
                ));
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  const _MovieItem({Key? key, required this.movie}) : super(key: key);

  final MovieResponse movie;

  @override
  Widget build(BuildContext context) {
    movie.heroId = 'search-${movie.id}';

    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/img/no-image.jpg'),
          image: NetworkImage(movie.fullPosterImg),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.routeDetails,
        arguments: movie,
      ),
    );
  }
}
