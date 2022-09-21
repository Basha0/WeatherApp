import 'package:weather/database/boxes.dart';
import 'package:weather/main.dart';
import 'package:weather/weather/model/weather_model.dart';

abstract class DataFetchingLogic {
  Future<WeatherModel> getWeather();
}

class DataFetcher implements DataFetchingLogic {

  @override
  Future<WeatherModel> getWeather() async {
    final weatherBox = await hiveService.open(Boxes.weather);
    return weatherBox.values.first;
  }
}
