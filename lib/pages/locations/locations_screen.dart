import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/providers/location_provider.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';
import '../../methods/global_methods.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var provider = context.watch<LocationsProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(tHomeTitle),
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        actions: [
          IconButton(
              onPressed: () {
                context.read<LocationsProvider>().changeIsSearching();
                context.read<LocationsProvider>().resetControllerSearch();
                context.read<LocationsProvider>().getLocations();
              },
              icon: provider.isSearching
                  ? const Icon(Icons.close)
                  : const Icon(Icons.search))
        ],
      ),
      body: Column(
        children: [
          provider.isSearching
              ? Container(
                  height: height * heigthSearch,
                  padding: const EdgeInsets.all(searchPadding),
                  child: TextField(
                    controller: provider.controllerSearch,
                    onChanged: (value) async =>
                        await context.read<LocationsProvider>().getLocations(),
                    decoration: const InputDecoration(
                        hintText: tSearch,
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(searchborderRadius)))),
                  ),
                )
              : Container(),
          SizedBox(
            height: provider.isSearching
                ? height * heigthListileSearching
                : height * heigthListile,
            child: provider.locations.isEmpty
                ? const Center(
                    child: Text(tDefault),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(charactersPadding),
                    itemCount: provider.locations.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        trailing: Text(
                          provider.locations[index].type,
                          style: TextStyle(
                              color: appBarColor, fontSize: height * subtitle),
                        ),
                        title: Text(
                          provider.locations[index].name,
                        ),
                        onTap: () {
                          generalDialog(
                            context,
                            provider,
                            index,
                            provider.locations[index].name,
                            tType,
                            provider.locations[index].type,
                            tDimension,
                            provider.locations[index].dimension,
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 2,
                      );
                    },
                  ),
          ),
          pagination(width, height, provider.page, provider.totalPages, context,
              () async {
            context.read<LocationsProvider>().incrementPage();
            await context.read<LocationsProvider>().getLocations();
          }, () async {
            context.read<LocationsProvider>().decreasePage();
            await context.read<LocationsProvider>().getLocations();
          })
        ],
      ),
    );
  }
}
