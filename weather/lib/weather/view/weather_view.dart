import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/database/providers/hive_db_providers.dart';
import 'package:weather/weather/widget/weather_grid_widget.dart';

import '../../available_cities/providers/cities_providers.dart';

class WeatherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).title)),
      body: WeatherGridWidget(),
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          final prov = ref.watch(dbWeatherProvider);
          return ElevatedButton(
            onPressed: () {
              prov.when(
                data: (data) {
                  print("i have data");
                  data.addCity(City("name", 23, 23));
                }, 
                error: (error, stackTrace) {
                  print("object");
                },
                loading: () {
                  print("sdasf");
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

class CitiesProvider {}

 /*@override
  Widget build(BuildContext context,WidgetRef ref) {
    final citiesProv = ref.watch(citiesProvider);
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context).title)),
        body:  WeatherGridWidget(citiesProv.allCities),
        
        floatingActionButton: ElevatedButton(
          onPressed: () {
            ref.read(citiesProvider).addCity(new City("name", 34, 23));
          },
          child: Container(
            child: Icon(Icons.gps_fixed),
          ),
        ));
  }*/