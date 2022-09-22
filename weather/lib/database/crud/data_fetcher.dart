import 'package:hive/hive.dart';
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/weather/model/weather_model.dart';

abstract class DataFetchingLogic {
  Future<WeatherModel?> getWeather(Box box);
  Future<List<City>> getAllCities(Box box);
}

class DataFetcher implements DataFetchingLogic {

  @override
  Future<WeatherModel?> getWeather(Box box) async {
    if(box.values.isNotEmpty) return box.values.first;
    return null;
  }
  @override
  Future<List<City>> getAllCities(Box box) async {
    if(box.values.isNotEmpty) return box.values.toList() as List<City>;
    return [];
  }
}
