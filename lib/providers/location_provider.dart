import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/locations_model.dart';

import '../data/remote/services_api.dart';

class LocationsProvider with ChangeNotifier {
  final _repository = ServicesAPI();

  List<Locations> _locations = [];
  List<Locations> get locations => _locations;

  void getList(List<Locations> listC) {
    _locations = listC;
    notifyListeners();
  }

  Future getLocations() async {
    var response = await _repository.getLocations();
    getList(List<Locations>.from(response.map((x) => Locations.fromJson(x))));
    notifyListeners();
  }
}
