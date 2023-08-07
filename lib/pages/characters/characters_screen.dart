import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';
import '../../methods/global_methods.dart';
import '../../providers/character_provider.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var provider = context.watch<CharactersProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(tHomeTitle),
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
        actions: [
          IconButton(
              onPressed: () {
                context.read<CharactersProvider>().changeIsSearching();
                context.read<CharactersProvider>().resetControllerSearch();
                context.read<CharactersProvider>().getCharacters();
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
                    onChanged: (value) async => await context
                        .read<CharactersProvider>()
                        .getCharacters(),
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
            child: provider.characters.isEmpty
                ? const Center(
                    child: Text(tDefault),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(charactersPadding),
                    itemCount: provider.characters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Image(
                              image: NetworkImage(
                                  provider.characters[index].image)),
                        ),
                        trailing: Text(
                          provider.characters[index].status,
                          style: TextStyle(
                              color: appBarColor, fontSize: height * subtitle),
                        ),
                        title: Text(
                          provider.characters[index].name,
                        ),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              final size = MediaQuery.of(context).size;
                              return Center(
                                child: Dialog(
                                    backgroundColor: Colors.transparent,
                                    child: SizedBox(
                                      height: size.height *
                                          sizedBoxDialogCharacters,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                              top: (size.height *
                                                      dialogPositioned) /
                                                  2,
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: size.height *
                                                        dialogMargin),
                                                decoration: BoxDecoration(
                                                  color: dialogColor,
                                                  border: Border.all(
                                                      width: borderDialogWidth,
                                                      color: appBarColor),
                                                  borderRadius: const BorderRadius
                                                          .all(
                                                      Radius.circular(
                                                          borderRadiusDialog)),
                                                ),
                                                height: size.height *
                                                    dialogHeigthCharacters,
                                                width: size.width * dialogWidth,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        provider
                                                            .characters[index]
                                                            .name,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: size
                                                                    .height *
                                                                sizeFontTitleDialog),
                                                      ),
                                                      const SizedBox(
                                                        height: sizedBoxDialog,
                                                      ),
                                                      Text(
                                                        '${provider.characters[index].status} - ${provider.characters[index].species}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: size
                                                                    .height *
                                                                sizeFontDialog),
                                                      ),
                                                      const SizedBox(
                                                        height: sizedBoxDialog,
                                                      ),
                                                      columnDialog(
                                                          tOrigin,
                                                          provider
                                                              .characters[index]
                                                              .origin,
                                                          size),
                                                      const SizedBox(
                                                        height: sizedBoxDialog,
                                                      ),
                                                      columnDialog(
                                                          tLocation,
                                                          provider
                                                              .characters[index]
                                                              .location,
                                                          size),
                                                    ]),
                                              )),
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: CircleAvatar(
                                              radius: borderAvatar,
                                              backgroundColor: getColor(provider
                                                  .characters[index].status),
                                              child: CircleAvatar(
                                                  radius: sizeAvatar,
                                                  backgroundImage: NetworkImage(
                                                      provider.characters[index]
                                                          .image)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                            },
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
            context.read<CharactersProvider>().incrementPage();
            await context.read<CharactersProvider>().getCharacters();
          }, () async {
            context.read<CharactersProvider>().decreasePage();
            await context.read<CharactersProvider>().getCharacters();
          })
        ],
      ),
    );
  }
}

getColor(String status) {
  switch (status) {
    case 'Alive':
      return appBarColor;
    case 'Dead':
      return deadColor;
    case 'unknown':
      return unknownColor;
  }
}
