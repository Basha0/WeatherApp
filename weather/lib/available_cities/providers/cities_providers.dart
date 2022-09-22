import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/available_cities/repository/cities_reposirtoy_impl.dart';



final citiesProvider = StateNotifierProvider((ref) => CitiesNotifier());