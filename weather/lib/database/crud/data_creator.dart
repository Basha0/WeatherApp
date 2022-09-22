import 'package:hive/hive.dart';
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/weather/model/weather_model.dart';

abstract class DataCreatingLogic {
  Future addWeather(WeatherModel weatherModel, Box box);
  Future saveCities(List<City> cities, Box box);
}

class DataCreator implements DataCreatingLogic {
  @override
  Future addWeather(WeatherModel weatherModel, Box box) async {
    await box.put(weatherModel.cityName, weatherModel);
  }

  @override
  Future saveCities(List<City> cities, Box box) async {
    cities.forEach((city) async {
      await box.put(city.name, city);
    });
  }
}
