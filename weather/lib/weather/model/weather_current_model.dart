import 'package:weather/weather/model/weather_state_model.dart';

class CurrentModel {
  late int currentTimeTimeStamp;
  late int temp;
  late List<Weather> weather;

  CurrentModel(this.currentTimeTimeStamp, this.temp, this.weather);

  CurrentModel.fromJson(
    Map<String, dynamic> json,
  ) {
    currentTimeTimeStamp = json["dt"];
    var value = json["temp"];
    if (value is double) {
      temp = value.toInt();
    } else {
      temp = value;
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
