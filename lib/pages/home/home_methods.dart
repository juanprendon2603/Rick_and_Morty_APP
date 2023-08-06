import 'package:flutter/material.dart';

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
            backgroundColor: buttonColor,
            onPressed: () {
              Navigator.pushNamed(
                context,
                route,
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
