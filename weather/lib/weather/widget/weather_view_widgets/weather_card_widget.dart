import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/weather/view/weather_detail_view.dart';

class WeatherCardWidget extends ConsumerWidget {
  final City city;
  const WeatherCardWidget(this.city);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WeatherDetaiView(city)),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.sunny),
                SizedBox(width: 16,),
                Text(city.name),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
