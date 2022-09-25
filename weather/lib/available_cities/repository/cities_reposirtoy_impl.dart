import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/available_cities/models/city_model.dart';

// Create a StateNotifier no notify listeners about changes
// For example if a City was added
class CitiesNotifier extends StateNotifier<List<City>> {
  CitiesNotifier() : super([]);

  addCity(City city, ) {
    state = [...state, city];
  }
  addAllCities(List<City> cities, ) {
    state = cities;
  }
}
