import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';
import '../../src/routes/routes.dart';
import 'home_methods.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(tHomeTitle),
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
      ),
      body: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              rowHome(
                context,
                width,
                height,
                iCharacters,
                tCharacters,
                characters,
                tButtonCharacters,
              ),
              rowHome(
                context,
                width,
                height,
                iLocations,
                tLocations,
                locations,
                tButtonLocations,
              ),
              rowHome(
                context,
                width,
                height,
                iEpisodes,
                tEpisodes,
                episodes,
                tButtonEpisodes,
              ),
            ],
          )),
    );
  }
}
