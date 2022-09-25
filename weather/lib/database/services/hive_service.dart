import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/weather/model/weather_model.dart';

class HiveService {
  static init() async {
    await initHive();
  }

  static initHive() async {
    final applicationSupportDirectory =
        await path.getApplicationSupportDirectory();
    Hive.init(applicationSupportDirectory.path);
    registerAdapter();
  }

  static Future<Box> open(String boxName) async {
    return await Hive.openBox(boxName);
  }

  static registerAdapter() {
    Hive.registerAdapter(WeatherModelAdapter());
    Hive.registerAdapter(CityAdapter());
  }
}
