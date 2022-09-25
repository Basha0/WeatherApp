import 'package:weather/database/resources/boxes.dart';
import 'package:weather/database/services/hive_service.dart';
import 'package:weather/weather/model/weather_model.dart';

abstract class DataUpdatingLogic {
  void updateweatherModel(WeatherModel weatherModel);
}

class DataUpdater implements DataUpdatingLogic {

  @override
  void updateweatherModel(WeatherModel weatherModel) async {
    var box = await HiveService.open(Boxes.weather);
    await box.put(weatherModel.cityName, weatherModel);
  }
}