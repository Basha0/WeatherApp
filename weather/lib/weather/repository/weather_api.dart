import 'package:weather/weather/model/weather_model.dart';

import '../../available_cities/models/city_model.dart';

abstract class WeatherApi {
  Future<WeatherModel> getWeather(City city);
}
