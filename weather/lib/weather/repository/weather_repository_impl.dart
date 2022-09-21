
import 'weather_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  // TODO add your methods here
}

final weatherRepositoryProvider = Provider<WeatherRepository>((ref) {
  return WeatherRepositoryImpl();
});
