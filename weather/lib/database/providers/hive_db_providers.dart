import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/database/services/hive_service.dart';

final dbWeatherProvider = FutureProvider<HiveDB>((ref) => HiveDB.create(ref));
