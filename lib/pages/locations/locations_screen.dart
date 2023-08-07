import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/providers/location_provider.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var provider = context.watch<LocationsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(tHomeTitle),
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(charactersPadding),
          itemCount: provider.locations.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              trailing: Text(
                provider.locations[index].type,
                style:
                    TextStyle(color: appBarColor, fontSize: height * subtitle),
              ),
              title: Text(
                provider.locations[index].name,
              ),
            );
          }),
    );
  }
}
