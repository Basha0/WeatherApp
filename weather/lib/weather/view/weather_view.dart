import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather/weather/widget/weather_view_widgets/add_city_widget.dart';
import 'package:weather/weather/widget/weather_view_widgets/weather_grid_widget.dart';

import '../../available_cities/models/city_model.dart';
import '../../available_cities/providers/cities_providers.dart';

class WeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).title)),
      body: WeatherGridWidget(),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          final cities = ref.watch(citiesProvider) as List<City>;
          return cities.isEmpty ? Container(): ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: AlertDialog(
                      content: Container(
                        child: AddCityWidget(),
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
                    child: Icon(Icons.gps_fixed),
                  ),
          );
        },
      ),
    );
  }
}
