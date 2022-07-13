import 'package:flutter/material.dart';
import 'package:video_games_app/models/models_export.dart';
import 'package:video_games_app/widgets/widgets_export.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(movie),
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(movie),
          _OverView(movie),
          CastingCards(movie.id),
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Movie movie;
  const _CustomAppBar(this.movie);

  @override
  Widget build(BuildContext context) {
    // el SliverAppBar es un widget muy similar al appbar normal, solo que en este se tiene mas control de las cosas
    return SliverAppBar(
      backgroundColor: const Color.fromARGB(255, 12, 17, 17),
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Hero(
          tag: movie.heroId!,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.fullPosterImg),
              height: 225,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  movie.title,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 219, 216, 216),
                      fontFamily: 'Lato',
                      fontSize: 30),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Text(
                movie.originalTitle,
                style: const TextStyle(
                    color: Color.fromARGB(255, 219, 216, 216),
                    fontFamily: 'Lato',
                    fontSize: 15),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_half_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${movie.voteAverage}',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 219, 216, 216),
                        fontFamily: 'Lato',
                        fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              )
            ],
          ),
        )
      ]),
    );
  }
}

class _OverView extends StatelessWidget {
  final Movie movie;
  const _OverView(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          color: Color.fromARGB(255, 219, 216, 216),
          fontSize: 18,
          fontFamily: 'Lato',
        ),
      ),
    );
  }
}
