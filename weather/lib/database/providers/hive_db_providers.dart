import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/available_cities/models/city_details.dart';
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/available_cities/providers/cities_providers.dart';
import 'package:weather/database/repository/hive_db_repository_impl.dart';

// create a Provider fro the Hive Database
final hiveDatabaseProvider = Provider<HiveDatabase>(
  (ref) => HiveDatabase(),
);

// Future Provider to Fetch all Cities from Database
final getAllCitiesProvider =
    FutureProvider.autoDispose<List<City>>((ref) async {
  // get cities State Provider
  final citiesStateProvider = ref.watch(citiesProvider.notifier);

  final hiveService = ref.read(hiveDatabaseProvider);
  // get all cities from database
  List<City> allCities = await hiveService.getAllCities();
  // if list is empty add predefined cities
  if (allCities.isEmpty) {
    allCities = AllCities.allCities.allCities;
    await hiveService.saveCities(allCities);
  }
  // add delay to display loading Animation else it would show and disappear to fast
  await Future.delayed(Duration(milliseconds: 1000));
  // notify cities State Provider
  citiesStateProvider.addAllCities(allCities);
  return allCities;
});

// add new City via GPS Provider
final addCityProvider = FutureProvider.family<void, City>((ref, city) async {
  final citiesStateProvider = ref.watch(citiesProvider.notifier);
  final hiveService = ref.read(hiveDatabaseProvider);
  await hiveService.addCity(city);
  // add delay to display loading Animation else it would show and disappear to fast
  await Future.delayed(Duration(milliseconds: 1000));
  // Notify citiesProvider about new City
  citiesStateProvider.addCity(city);
  EasyLoading.dismiss();
  return;
});
