import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/providers/character_provider.dart';
import 'package:rick_and_morty_app/src/routes/pages.dart';
import 'package:rick_and_morty_app/src/routes/routes.dart';

Future<void> main() async {
  runApp(ChangeNotifierProvider(
    create: (_) => CharactersProvider(),
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
    );
  }
}
