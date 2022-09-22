import 'package:hive/hive.dart';
import 'package:weather/database/crud/data_creator.dart';
import 'package:weather/database/crud/data_fetcher.dart';
import 'package:weather/database/crud/data_updater.dart';
import 'package:weather/database/repository/hive_db_repository.dart';
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/weather/model/weather_model.dart';

class HiveDatabase implements HiveDatabaseLogic {
  static final HiveDatabase _singleton = new HiveDatabase._internal();
  HiveDatabase._internal();
  static HiveDatabase getInstance() => _singleton;

  DataCreatingLogic _dataCreator = DataCreator();
  DataFetchingLogic _dataFetcher = DataFetcher();
  DataUpdatingLogic _dataUpdater = DataUpdater();

  // Fetch
  @override
  Future<WeatherModel?> getWeather(Box box) async {
    return _dataFetcher.getWeather(box);
  }

  @override
  Future<List<City>> getAllCities( Box box) async {
    return await _dataFetcher.getAllCities(box);
  }

  //Create
  @override
  Future addWeather(WeatherModel weatherModel, Box box) async {
    return _dataCreator.addWeather(weatherModel, box);
  }

  @override
  Future saveCities(List<City> cities, Box box) async {
    return await _dataCreator.saveCities(cities, box);
  }

  //Update
  @override
  Future updateWeather(WeatherModel weatherModel, Box box) async {
    return _dataUpdater.updateweatherModel(weatherModel, box);
  }
}
