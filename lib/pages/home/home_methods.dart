import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/providers/character_provider.dart';
import 'package:rick_and_morty_app/src/routes/routes.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

Row rowHome(
  BuildContext context,
  double width,
  double height,
  String image,
  String title,
  String route,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Card(
        child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3))),
          child: Container(
            padding: const EdgeInsets.all(homePadding),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: appBarColor,
                  width: borderWidth,
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(
                  image: AssetImage(
                    image,
                  ),
                  width: width * imageWidth,
                ),
                const SizedBox(
                  height: homePadding,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      SizedBox(
        width: width * buttonHomeWidth,
        child: FittedBox(
          child: FloatingActionButton(
            heroTag: "btn1",
            backgroundColor: buttonColor,
            onPressed: () async {
              await context.read<CharactersProvider>().getCharacters();
              Navigator.pushNamed(
                context,
                characters,
              );
            },
            child: const Icon(
              Icons.arrow_forward,
            ),
          ),
        ),
      ),
    ],
  );
}
