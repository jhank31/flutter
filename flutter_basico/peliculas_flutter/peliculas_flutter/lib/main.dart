import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_games_app/screens/screen_export.dart';
import 'package:video_games_app/providers/movies_providers.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'details': (_) => const DetailScreen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 24, 36, 43),
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 12, 17, 17),
          centerTitle: true,
          titleTextStyle: TextStyle(
              fontFamily: 'Libre',
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
