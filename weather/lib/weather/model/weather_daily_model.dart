import 'package:weather/weather/model/weather_state_model.dart';

import 'package:hive/hive.dart';

part 'weather_daily_model.g.dart';

@HiveType(typeId: 2)
class DailyModel {
   @HiveField(0)
  late int currentTimeTimeStamp;
   @HiveField(1)
  late Map<String, dynamic> temp;
   @HiveField(2)
  late List<Weather> weather;

  DailyModel(this.currentTimeTimeStamp, this.temp, this.weather);

  DailyModel.fromJson(
    Map<String, dynamic> json,
  ) {
    currentTimeTimeStamp = json["dt"];
    if (json["temp"] is Map) {
      Map map = json["temp"];
      temp = {};
      map.forEach((key, value) {
        if (value is double) {
          temp.addAll({key: value.toInt()});
        } else {
          temp.addAll({key: value});
        }
      });
    }
    if (json["weather"] is List) {
      List<dynamic> list = json["weather"];
      weather = [];
      list.forEach((map) {
        weather.add(Weather.fromJson(map));
      });
    }
  }
}
