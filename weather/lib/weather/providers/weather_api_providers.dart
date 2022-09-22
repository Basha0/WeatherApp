import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/weather/repository/http_weather_client.dart';
import '../../available_cities/models/city_model.dart';
import '../model/weather_model.dart';

final httpWeatherClient =
    Provider<HttpWeatherClient>((ref) => HttpWeatherClient());

final weatherResponseProvider =
    FutureProvider.family<WeatherModel, City>((ref, city) async {
  final httpClient = ref.read(httpWeatherClient);
  return await httpClient.getWeather(city);
});

