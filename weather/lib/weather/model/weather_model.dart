import 'package:hive/hive.dart';

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
  Map<String, dynamic>? current;
  @HiveField(6)
  List<dynamic>? daily;

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
    if (json['current'] != null) {
      current = <String, dynamic>{};

      json['current'].forEach((k, v) {
        final map = <String, dynamic>{k as String: v};
        current!.addAll(map);
      });
    }
    if (json['daily'] != null) {
      daily = <dynamic>[];
      json['daily'].forEach((v) {
        daily!.add(v);
      });
    }
  }
}
