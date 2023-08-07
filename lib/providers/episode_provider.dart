import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/episodes_model.dart';

import '../data/remote/services_api.dart';

class EpisodesProvider with ChangeNotifier {
  final _repository = ServicesAPI();

  List<Episodes> _episodes = [];
  List<Episodes> get episodes => _episodes;

  void getList(List<Episodes> listC) {
    _episodes = listC;
    notifyListeners();
  }

  Future getEpisodes() async {
    var response = await _repository.getEpisodes();
    getList(List<Episodes>.from(response.map((x) => Episodes.fromJson(x))));
    notifyListeners();
  }
}
