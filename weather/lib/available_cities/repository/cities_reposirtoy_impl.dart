import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/available_cities/models/city_model.dart';

class CitiesNotifier extends StateNotifier<List<City>> {
  CitiesNotifier() : super([]);

  addCity(City city, ) {
    state = [...state, city];
  }
  addAllCities(List<City> cities, ) {
    state = cities;
  }
}
