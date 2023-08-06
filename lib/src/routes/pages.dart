import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/pages/characters/characters_screen.dart';
import 'package:rick_and_morty_app/pages/episodes/episodes_screen.dart';
import 'package:rick_and_morty_app/pages/home/home_screen.dart';
import 'package:rick_and_morty_app/pages/locations/locations_screen.dart';
import 'package:rick_and_morty_app/pages/welcome/welcome_screen.dart';
import 'package:rick_and_morty_app/src/routes/routes.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  welcome: (_) => const WelcomeScreen(),
  home: (_) => const HomeScreen(),
  characters: (_) => const CharactersScreen(),
  locations: (_) => const LocationsScreen(),
  episodes: (_) => const EpisodesScreen(),
};
