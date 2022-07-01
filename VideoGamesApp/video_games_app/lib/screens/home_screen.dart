import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_games_app/providers/movies_providers.dart';
import 'package:video_games_app/widgets/widgets_export.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    print(moviesProvider.onDisplayMovies);

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Peliculas en cine')),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
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
              ),
            ],
          ),
        ));
  }
}
