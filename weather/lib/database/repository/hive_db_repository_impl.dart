import 'package:weather/database/crud/data_creator.dart';
import 'package:weather/database/crud/data_fetcher.dart';
import 'package:weather/database/repository/hive_db_repository.dart';
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/weather/model/weather_model.dart';

class HiveDatabase implements HiveDatabaseLogic {
  DataCreatingLogic _dataCreator = DataCreator();
  DataFetchingLogic _dataFetcher = DataFetcher();

  // Fetch

  // Fetching WeatherModel from database
  @override
  Future<WeatherModel?> getWeather(String cityName) async {
    return _dataFetcher.getWeather(cityName);
  }

// Fetching all cities from database
  @override
  Future<List<City>> getAllCities() async {
    return await _dataFetcher.getAllCities();
  }

  //Create

  // Save WeatherModel to database
  @override
  Future addWeather(WeatherModel weatherModel) async {
    return _dataCreator.addWeather(weatherModel);
  }

  // Save all predfined cities to database
  @override
  Future addCities(List<City> cities) async {
    return await _dataCreator.addCities(cities);
  }

  // Save a new City to database
  @override
  Future addCity(City city) async {
    return await _dataCreator.addCity(city);
  }
}
