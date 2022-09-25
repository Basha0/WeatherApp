import 'package:weather/weather/model/weather_state_model.dart';
import 'package:hive/hive.dart';
part 'weather_current_model.g.dart';


@HiveType(typeId: 3)
class CurrentModel {
  @HiveField(0)
  late int currentTimeTimeStamp;
  @HiveField(1)
  late int temp;
  @HiveField(2)
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
