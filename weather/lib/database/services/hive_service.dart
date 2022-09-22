import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:weather/available_cities/providers/cities_providers.dart';
import 'package:weather/database/repository/hive_db_repository_impl.dart';
import 'package:weather/database/resources/boxes.dart';
import 'package:weather/available_cities/models/city_details.dart';
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/weather/model/weather_model.dart';
import 'package:weather/weather/view/weather_view.dart';

import '../../available_cities/repository/cities_reposirtoy_impl.dart';

class HiveDB {
  late Box weatherBox;
  late Box cityBox;
  late CitiesNotifier _citiesProvider;
  HiveDatabase _hiveDatabase = HiveDatabase.getInstance();
  HiveDB._create() {}
  static Future<HiveDB> create(FutureProviderRef<HiveDB> ref) async {
    final component = HiveDB._create();
    await component._init(ref);

    return component;
  }

  _init(FutureProviderRef<HiveDB> ref) async {
    Hive.registerAdapter(WeatherModelAdapter());
    Hive.registerAdapter(CityAdapter());
    this.weatherBox = await Hive.openBox<WeatherModel>(Boxes.weather);
    this.cityBox = await Hive.openBox<City>(Boxes.city);
    final provider = ref.watch(citiesProvider.notifier);
    this._citiesProvider = provider;
    print("sd");
    saveStarterCities();
  }

  saveStarterCities() {
    List<City> allCities = getAllCities();
    if (_citiesProvider.state.isEmpty) {
      _citiesProvider.addAllCities(allCities);
    }

    if (allCities.isEmpty) {
      allCities = AllCieties.allCieties.allCieties;
      cityBox.addAll(allCities);
    }
  }

  addCity(City city) {
    cityBox.add(city);
    _citiesProvider.addCity(city);
  }

  List<City> getAllCities() {
    return this.cityBox.values.toList() as List<City>;
  }

  addWeather(WeatherModel weatherModel) {
    _hiveDatabase.addWeather(weatherModel, weatherBox);
  }

  Future<WeatherModel?> getWeather() {
    return _hiveDatabase.getWeather(weatherBox);
  }
}
