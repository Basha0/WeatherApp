import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/available_cities/providers/cities_providers.dart';
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/weather/widget/weather_card_widget.dart';

import '../view/weather_view.dart';

class WeatherGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final cities = ref.watch(citiesProvider) as List<City>;
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
              childAspectRatio: 1,
              crossAxisSpacing: 0,
              mainAxisSpacing: 8),
          itemCount: cities.length,
          itemBuilder: (context, index) {
            return WeatherCardWidget(cities[index]);
          },
        );
      },
    );
  }
}
