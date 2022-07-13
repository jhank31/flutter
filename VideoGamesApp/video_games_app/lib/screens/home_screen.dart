import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_games_app/providers/movies_providers.dart';
import 'package:video_games_app/search/search_delegate.dart';
import 'package:video_games_app/widgets/widgets_export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'Peliculas en cine',
            style: TextStyle(
              color: Color.fromARGB(255, 231, 255, 255),
            ),
          )),
          elevation: 15,
          shadowColor: const Color.fromARGB(255, 51, 150, 150),
          actions: [
            IconButton(
                color: const Color.fromARGB(255, 231, 255, 255),
                onPressed: () => showSearch(
                  context: context,
                  delegate: MovieSearchDelegate()
                ),
                icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //tarjetas principales
                CardSwiper(
                  movies: moviesProvider.onDisplayMovies,
                ),
                //slider de peliculas
                MovieSlider(
                  movies: moviesProvider.popularMovies,
                  title: 'Populares',
                  onNextPage: () => moviesProvider.getPopularMovies(),
                ),
              ],
            ),
          ),
        ));
  }
}
