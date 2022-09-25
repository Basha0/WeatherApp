import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/database/resources/boxes.dart';
import 'package:weather/database/services/hive_service.dart';
import 'package:weather/weather/model/weather_model.dart';

abstract class DataCreatingLogic {
  Future addWeather(WeatherModel weatherModel);
  Future saveCities(List<City> cities);
  Future addCity(City city);
}

class DataCreator implements DataCreatingLogic {
  @override
  Future addWeather(WeatherModel weatherModel) async {
    var box = await HiveService.open(Boxes.weather);
    await box.put(weatherModel.cityName, weatherModel);
  }

  @override
  Future saveCities(List<City> cities) async {
    var box = await HiveService.open(Boxes.city);
    cities.forEach((city) async {
      await box.put(city.name, city);
    });
  }

  @override
  Future addCity(City city) async {
    var box = await HiveService.open(Boxes.city);
    await box.put(city.name, city);
  }
}
