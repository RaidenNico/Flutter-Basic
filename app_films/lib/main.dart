import 'package:app_films/providers/movie.provider.dart';
import 'package:app_films/routers/app.routes.dart';
import 'package:app_films/themes/app.theme.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String title = 'Peliculas';

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        initialRoute: AppRoutes.initialRoutes,
        routes: AppRoutes.getAppRoutes(),
        theme: AppTheme.ligthTheme);
  }
}
