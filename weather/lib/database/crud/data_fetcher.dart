import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/database/resources/boxes.dart';
import 'package:weather/database/services/hive_service.dart';
import 'package:weather/weather/model/weather_model.dart';

abstract class DataFetchingLogic {
  Future<WeatherModel?> getWeather(String cityName);
  Future<List<City>> getAllCities();
}

class DataFetcher implements DataFetchingLogic {

  @override
  Future<WeatherModel?> getWeather(String cityName) async {
    var box = await HiveService.open(Boxes.weather);
    if(box.values.isNotEmpty) return box.get(cityName);
    return null;
  }
  @override
  Future<List<City>> getAllCities() async {
    var box = await HiveService.open(Boxes.city);
    List<City> cities = [];
    box.values.forEach((b) {
      City city = b;
      cities.add(city);
    });
    return cities;
  }
}
