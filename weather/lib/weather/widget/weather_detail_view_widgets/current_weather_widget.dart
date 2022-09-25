import 'package:flutter/material.dart';
import 'package:weather/ressources/constants.dart';
import 'package:weather/ressources/converter.dart';
import 'package:weather/weather/model/weather_current_model.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final CurrentModel currentWeather;
  final String cityName;
  CurrentWeatherWidget(this.currentWeather, this.cityName);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent.withOpacity(0.5),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Convert TimeStamp to date
                      Text(
                        ConvertionHelper.parseTimeStamp(
                            currentWeather.currentTimeTimeStamp, Constants.dayHourFormat ) + cityName,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  
                  Text(
                    currentWeather.temp.toString() + "°C",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    currentWeather.weather.first.description,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ],
          ),
      ),
    );
  }
}
