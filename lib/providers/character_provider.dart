import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/characters_model.dart';

import '../data/remote/services_api.dart';

class CharactersProvider with ChangeNotifier {
  final _repository = ServicesAPI();

  List<Character> _characters = [];
  List<Character> get characters => _characters;

  void getList(List<Character> listC) {
    _characters = listC;
    notifyListeners();
  }

  Future getCharacters() async {
    var response = await _repository.getCharacters();
    getList(List<Character>.from(response.map((x) => Character.fromJson(x))));
    notifyListeners();
  }
}
