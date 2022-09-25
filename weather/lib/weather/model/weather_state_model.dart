
import 'package:hive/hive.dart';

part 'weather_state_model.g.dart';
@HiveType(typeId: 4)
class Weather {
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String main;
  @HiveField(2)
  late String description;
  @HiveField(3)
  late String weatherIcon;
  Weather(this.id, this.main, this.description, this.weatherIcon);

  Weather.fromJson(
    Map<String, dynamic> json,
  ) {
    id = json["id"];
    main = description = json["description"];
    weatherIcon = json["icon"];
  }
}

