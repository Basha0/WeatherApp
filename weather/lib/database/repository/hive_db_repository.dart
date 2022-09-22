import 'package:hive/hive.dart';
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/weather/model/weather_model.dart';

abstract class HiveDatabaseLogic {
  //Fetch
  Future<WeatherModel?> getWeather( Box box);
  Future<List<City>> getAllCities( Box box);

  //Create
  Future addWeather(WeatherModel weatherModel, Box box);
  Future saveCities(List<City> cities, Box box);

  //Update
  Future updateWeather(WeatherModel weatherModel, Box box);

}