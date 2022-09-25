import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/available_cities/providers/cities_providers.dart';
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/database/providers/hive_db_providers.dart';
import 'package:weather/weather/widget/weather_view_widgets/weather_card_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeatherGridWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(getAllCitiesProvider);

    return Consumer(builder: (context, reference, child) {
      final cities = reference.watch(citiesProvider) as List<City>;
      if (cities.isEmpty) EasyLoading.show(status: AppLocalizations.of(context).loadingCities);
      if (cities.isNotEmpty) EasyLoading.dismiss();

      return ListView.builder(
        
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return WeatherCardWidget(cities[index]);
        },
      );
    });
  }
}
