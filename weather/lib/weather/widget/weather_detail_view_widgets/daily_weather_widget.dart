import 'package:flutter/material.dart';
import 'package:weather/ressources/constants.dart';
import 'package:weather/ressources/converter.dart';
import 'package:weather/weather/model/weather_daily_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DailyWeatherWidget extends StatelessWidget {
  final List<DailyModel> dailyModel;
  DailyWeatherWidget(this.dailyModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent.withOpacity(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              "Daily Weather",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Container(
            height: 200,
            margin: const EdgeInsets.all(8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dailyModel.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ConvertionHelper.parseTimeStamp(
                            dailyModel[index].currentTimeTimeStamp,
                            Constants.dayFormat),
                      ),
                      Text(
                        "min: ${dailyModel[index].temp["min"]} °C",
                      ),
                      Text(
                        "max: ${dailyModel[index].temp["max"]} °C",
                      ),
                      Text(
                        "${AppLocalizations.of(context).day}: ${dailyModel[index].temp["day"]} °C",
                      ),
                      Text(
                        "${AppLocalizations.of(context).night}: ${dailyModel[index].temp["night"]} °C",
                      ),
                      Text(
                        dailyModel[index].weather.first.description,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
