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
    var response =
        await _repository.getCharacters(_page, _controllerSearch.text);
    if (response['status'] == 200) {
      getList(List<Character>.from(
          response['data']['results'].map((x) => Character.fromJson(x))));
      getInfo(response['data']['info']);
    } else {
      characters.clear();
    }

    notifyListeners();
  }

  Map<String, dynamic> _info = {};
  Map<String, dynamic> get info => _info;

  void getInfo(Map<String, dynamic> info) {
    _info = info;
    _totalPages = info['pages'];
    notifyListeners();
  }

  int _page = 1;
  int get page => _page;

  void resetPage() {
    _page = 1;
    notifyListeners();
  }

  void incrementPage() {
    _page++;
    notifyListeners();
  }

  void decreasePage() {
    _page--;
    notifyListeners();
  }

  int _totalPages = 0;
  int get totalPages => _totalPages;

  bool _isSearching = false;
  bool get isSearching => _isSearching;

  void changeIsSearching() {
    _isSearching = !_isSearching;
    notifyListeners();
  }

  final TextEditingController _controllerSearch = TextEditingController();
  TextEditingController get controllerSearch => _controllerSearch;

  void resetControllerSearch() {
    _controllerSearch.clear();
    notifyListeners();
  }
}
