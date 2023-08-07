import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/constants/colors.dart';
import 'package:rick_and_morty_app/providers/character_provider.dart';
import 'package:rick_and_morty_app/providers/episode_provider.dart';
import 'package:rick_and_morty_app/providers/location_provider.dart';
import 'package:rick_and_morty_app/src/routes/pages.dart';
import 'package:rick_and_morty_app/src/routes/routes.dart';

Future<void> main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => CharactersProvider()),
      ChangeNotifierProvider(create: (_) => EpisodesProvider()),
      ChangeNotifierProvider(create: (_) => LocationsProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      initialRoute: welcome,
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: appBarColor,
            ),
      ),
    );
  }
}
