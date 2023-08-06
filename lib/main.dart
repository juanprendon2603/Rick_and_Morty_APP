import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:rick_and_morty_app/src/routes/pages.dart';
import 'package:rick_and_morty_app/src/routes/routes.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [router.observer],
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      initialRoute: welcome,
    );
  }
}
