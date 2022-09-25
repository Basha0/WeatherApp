import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/available_cities/repository/cities_reposirtoy_impl.dart';

// Create a provider no notify listeners about changes
// For example if a City was added
final citiesProvider = StateNotifierProvider((ref) => CitiesNotifier());