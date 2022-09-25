import 'package:weather/database/crud/data_creator.dart';
import 'package:weather/database/crud/data_fetcher.dart';
import 'package:weather/database/crud/data_updater.dart';
import 'package:weather/database/repository/hive_db_repository.dart';
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/weather/model/weather_model.dart';

class HiveDatabase implements HiveDatabaseLogic {
  DataCreatingLogic _dataCreator = DataCreator();
  DataFetchingLogic _dataFetcher = DataFetcher();
  DataUpdatingLogic _dataUpdater = DataUpdater();

  // Fetch
  @override
  Future<WeatherModel?> getWeather() async {
    return _dataFetcher.getWeather();
  }

  @override
  Future<List<City>> getAllCities() async {
    return await _dataFetcher.getAllCities();
  }

  //Create
  @override
  Future addWeather(WeatherModel weatherModel) async {
    return _dataCreator.addWeather(weatherModel);
  }

  @override
  Future saveCities(List<City> cities) async {
    return await _dataCreator.saveCities(cities);
  }

  @override
  Future addCity(City city) async {
    return await _dataCreator.addCity(city);
  }

  //Update
  @override
  Future updateWeather(WeatherModel weatherModel) async {
    return _dataUpdater.updateweatherModel(weatherModel);
  }
}
