import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/providers/episode_provider.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/text_strings.dart';
import '../../methods/global_methods.dart';

class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var provider = context.watch<EpisodesProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(tHomeTitle),
        automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * heigthListile,
            child: ListView.separated(
              padding: const EdgeInsets.all(charactersPadding),
              itemCount: provider.episodes.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  trailing: Text(
                    provider.episodes[index].episode,
                    style: TextStyle(
                        color: appBarColor, fontSize: height * subtitle),
                  ),
                  title: Text(
                    provider.episodes[index].name,
                  ),
                  onTap: () {
                    generalDialog(
                      context,
                      provider,
                      index,
                      provider.episodes[index].name,
                      tEpisodeNumber,
                      provider.episodes[index].episode,
                      tAirDate,
                      provider.episodes[index].airDate,
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
            context.read<EpisodesProvider>().incrementPage();
            await context.read<EpisodesProvider>().getEpisodes();
          }, () async {
            context.read<EpisodesProvider>().decreasePage();
            await context.read<EpisodesProvider>().getEpisodes();
          })
        ],
      ),
    );
  }
}
