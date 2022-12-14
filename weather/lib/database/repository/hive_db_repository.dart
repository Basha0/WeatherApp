import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/weather/model/weather_model.dart';

abstract class HiveDatabaseLogic {
  //Fetch
  Future<WeatherModel?> getWeather(String cityName);
  Future<List<City>> getAllCities();

  //Create
  Future addWeather(WeatherModel weatherModel);
  Future addCity(City city);
  Future addCities(List<City> cities);
}
