import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/available_cities/models/city_model.dart';

class WeatherCardWidget extends ConsumerWidget {
  final City city;
  const WeatherCardWidget(this.city);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        //TODO add navigation
        //TODO add new city to database
      },
      child: Card(
        shadowColor: Colors.white,
        elevation: 3,
        child: Container(
          child: Row(
            children: [
              Icon(Icons.sunny),
              Column(
                children: [Text(city.name)],
              )
            ],
          ),
        ),
      ),
    );
  }
}
