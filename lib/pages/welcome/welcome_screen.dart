import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/src/routes/routes.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Image(
                image: AssetImage(iWelcome),
              ),
              Text(
                tWelcomeTitle,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: height * title),
              ),
              Text(
                tWelcomeSsubtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.normal, fontSize: height * subtitle),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    home,
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: buttonColor),
                child: SizedBox(
                    width: width * buttonWidth,
                    child: const Text(
                      tWelcomeButton,
                      textAlign: TextAlign.center,
                    )),
              ),
            ],
          )),
    );
  }
}
