import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/weather/widget/weather_detail_view_widgets/current_weather_widget.dart';
import 'package:weather/weather/widget/weather_detail_view_widgets/daily_weather_widget.dart';

import '../providers/weather_api_providers.dart';

class WeatherDetaiView extends ConsumerWidget {
  final City city;
  const WeatherDetaiView(this.city);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(weatherResponseProvider(city)).map(
      data: (data) {
        EasyLoading.dismiss();
        return Scaffold(
          appBar: AppBar(
            title: Text(city.name),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              SvgPicture.asset(
                "assets/splash.svg",
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  CurrentWeatherWidget(data.value.current!, city.name),
                  DailyWeatherWidget(data.value.daily!),
                ],
              ),
            ],
          ),
        );
      },
      error: (error) {
        return Text("Weater Error.");
      },
      loading: (loading) {
        EasyLoading.show(status: "Loading Weather...");
        return Container();
      },
    );
  }
}