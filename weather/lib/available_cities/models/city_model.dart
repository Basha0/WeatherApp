import 'package:hive/hive.dart';

part 'city_model.g.dart';

@HiveType(typeId: 1)
class City {
  @HiveField(0)
  String name;
  @HiveField(1)
  double lat;
  @HiveField(2)
  double long;

  City(this.name, this.lat, this.long);
}