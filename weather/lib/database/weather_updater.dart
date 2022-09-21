
import 'package:weather/database/boxes.dart';
import 'package:weather/main.dart';
import 'package:weather/weather/model/weather_model.dart';

abstract class DataUpdatingLogic {
  void updateweatherModel(WeatherModel weatherModel);
}

class DataUpdater implements DataUpdatingLogic {

  @override
  void updateweatherModel(WeatherModel weatherModel) async {
    final folderBox = await hiveService.open(Boxes.weather);
    //TODO change key
    await folderBox.put("weatherModel.timeStamp", weatherModel);
  }
}