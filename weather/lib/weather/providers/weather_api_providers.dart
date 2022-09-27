import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/database/providers/hive_db_providers.dart';
import 'package:weather/l10n/language_providers/language_provider.dart';
import 'package:weather/weather/repository/http_weather_client.dart';
import '../../available_cities/models/city_model.dart';
import '../model/weather_model.dart';

final httpWeatherClient =
    Provider<HttpWeatherClient>((ref) => HttpWeatherClient());

// Auto dispose disposes the state after navigation back in the
// only called in Weather Details view
final weatherResponseProvider =
    FutureProvider.autoDispose.family<WeatherModel?, City>((ref, city) async {
  // check current connection status of User
  ConnectivityResult result = await Connectivity().checkConnectivity();
  // create a hiveService reference
  final hiveService = ref.read(hiveDatabaseProvider);
  WeatherModel? weatherModel;
  // depending on the connection
  switch (result) {
    case ConnectivityResult.none:
      // Fetch weatherModel from database if available
      weatherModel = await hiveService.getWeather(city.name);
      break;
    default:
      // request weatherModel from api
      final httpClient = ref.read(httpWeatherClient);
      final languageNotifier = ref.watch(languageProvider) as Locale;
      // add Delay as sometimes loading screen disappears fast
      Future.delayed(Duration(milliseconds: 500));
      weatherModel =
          await httpClient.getWeather(city, languageNotifier.languageCode);
      // save weatherModel to database
      await hiveService.addWeather(weatherModel);
  }
  return weatherModel;
});
