import 'package:weather/weather/model/weather_state_model.dart';

class DailyModel {
  late int currentTimeTimeStamp;
  late Map<String, dynamic> temp;
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
