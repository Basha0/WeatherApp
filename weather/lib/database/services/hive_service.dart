import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/weather/model/weather_current_model.dart';
import 'package:weather/weather/model/weather_daily_model.dart';
import 'package:weather/weather/model/weather_model.dart';
import 'package:weather/weather/model/weather_state_model.dart';

class HiveService {
  static init() async {
    await initHive();
  }

  // Set path where the database files will be saved
  static initHive() async {
    final applicationSupportDirectory =
        await path.getApplicationSupportDirectory();
    Hive.init(applicationSupportDirectory.path);
    registerAdapter();
  }

  static Future<Box> open(String boxName) async {
    return await Hive.openBox(boxName);
  }

  // Register Adapter generated for the models that are saved in the database
  static registerAdapter() {
    Hive.registerAdapter(WeatherModelAdapter());
    Hive.registerAdapter(CityAdapter());
    Hive.registerAdapter(CurrentModelAdapter());
    Hive.registerAdapter(DailyModelAdapter());
    Hive.registerAdapter(WeatherAdapter());
  }
}
