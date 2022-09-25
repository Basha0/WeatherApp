import 'package:hive/hive.dart';
import 'package:weather/weather/model/weather_current_model.dart';
import 'package:weather/weather/model/weather_daily_model.dart';

part 'weather_model.g.dart';

@HiveType(typeId: 0)
class WeatherModel {
  @HiveField(0)
  String? cityName;
  @HiveField(1)
  double? lat;
  @HiveField(2)
  double? lon;
  @HiveField(3)
  String? timezone;
  @HiveField(4)
  int? timezoneOffset;
  @HiveField(5)
  CurrentModel? current;
  @HiveField(6)
  List<DailyModel>? daily;

  WeatherModel(
      {this.cityName,
      this.lat,
      this.lon,
      this.timezone,
      this.timezoneOffset,
      this.current,
      this.daily});

  WeatherModel.fromJson(Map<String, dynamic> json, String cityName) {
    this.cityName = cityName;
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current = CurrentModel.fromJson(json["current"]);
    if (json["daily"] is List) {
      List<dynamic> list = json["daily"];
      daily = [];
      list.forEach((map) {
        daily!.add(DailyModel.fromJson(map));
      });
    }
  }
}





