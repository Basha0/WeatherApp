import 'dart:convert';
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/weather/model/weather_model.dart';
import 'package:http/http.dart' as http;
import 'package:weather/weather/repository/weather_api.dart';

class HttpWeatherClient extends WeatherApi {
  Future<WeatherModel> getWeather(City city) async {
    String url =
        "https://api.openweathermap.org/data/3.0/onecall?lat=${city.lat}&lon=${city.long}&exclude=hourly,minutely&units=metric&appid=4ab67fbd0c8980730cdf2dfd246fa55a";
    var response = await http.Client().get(Uri.parse(url), headers: {
      "Content-Type": "application/json; charset=utf-8",
    });
    final jsonResult = jsonDecode(utf8.decode(response.bodyBytes));
    WeatherModel weatherModel = WeatherModel.fromJson(jsonResult, city.name);
    return weatherModel;
  }
}
