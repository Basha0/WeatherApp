
import 'package:weather/database/data_creator.dart';
import 'package:weather/database/data_fetcher.dart';
import 'package:weather/database/weather_updater.dart';
import 'package:weather/weather/model/weather_model.dart';

abstract class HiveDatabaseLogic {
  //Fetch
  Future<WeatherModel> getWeather();

  //Create
  Future addWeather(WeatherModel weatherModel);

  //Update
  Future updateWeather(WeatherModel weatherModel);

}

class HiveDatabase implements HiveDatabaseLogic {
  static final HiveDatabase _singleton = new HiveDatabase._internal();
  HiveDatabase._internal();
  static HiveDatabase getInstance() => _singleton;

  DataCreatingLogic _dataCreator = DataCreator();
  DataFetchingLogic  _dataFetcher = DataFetcher();
  DataUpdatingLogic  _dataUpdater = DataUpdater();

  // Fetch
  @override
  Future<WeatherModel> getWeather() async {
    return _dataFetcher.getWeather();
  }

  //Create
  @override
  Future addWeather(WeatherModel weatherModel) async {
    return _dataCreator.addWeather(weatherModel);
  }


  //Update
  @override
  Future updateWeather(WeatherModel weatherModel) async {
    return _dataUpdater.updateweatherModel(weatherModel);
  }

}