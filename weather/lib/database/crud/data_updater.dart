
import 'package:hive_flutter/adapters.dart';
import 'package:weather/weather/model/weather_model.dart';

abstract class DataUpdatingLogic {
  void updateweatherModel(WeatherModel weatherModel, Box box);
}

class DataUpdater implements DataUpdatingLogic {

  @override
  void updateweatherModel(WeatherModel weatherModel, Box box) async {
    await box.put(weatherModel.cityName, weatherModel);
  }
}