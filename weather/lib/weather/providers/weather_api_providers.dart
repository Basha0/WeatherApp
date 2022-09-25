import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/l10n/language_prviders/language_provider.dart';
import 'package:weather/weather/repository/http_weather_client.dart';
import '../../available_cities/models/city_model.dart';
import '../model/weather_model.dart';

final httpWeatherClient =
    Provider<HttpWeatherClient>((ref) => HttpWeatherClient());

final weatherResponseProvider =
    FutureProvider.autoDispose.family<WeatherModel, City>((ref, city) async {
  final httpClient = ref.read(httpWeatherClient);
  final languageNotifier = ref.watch(languageProvider) as Locale;
  Future.delayed(Duration(milliseconds: 500));
  return await httpClient.getWeather(city, languageNotifier.languageCode);
});

