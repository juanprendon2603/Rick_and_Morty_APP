import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';
import '../../providers/character_provider.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var provider = context.watch<CharactersProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(tHomeTitle),
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(charactersPadding),
          itemCount: provider.characters.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                child: Image(
                    image: NetworkImage(provider.characters[index].image)),
              ),
              trailing: Text(
                provider.characters[index].status,
                style:
                    TextStyle(color: appBarColor, fontSize: height * subtitle),
              ),
              title: Text(
                provider.characters[index].name,
              ),
            );
          }),
    );
  }
}
