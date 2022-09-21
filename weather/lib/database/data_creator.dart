

import 'package:weather/database/boxes.dart';
import 'package:weather/main.dart';
import 'package:weather/weather/model/weather_model.dart';

abstract class DataCreatingLogic {
  Future addWeather(WeatherModel weatherModel);
}

class DataCreator implements DataCreatingLogic {

  @override
  Future addWeather(WeatherModel weatherModel) async {
    final folderBox = await hiveService.open(Boxes.weather);
    await folderBox.put("weatherModel.timeStamp", weatherModel);
  }

 
}