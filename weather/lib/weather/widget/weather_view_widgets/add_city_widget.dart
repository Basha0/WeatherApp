import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/database/providers/hive_db_providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather/location/locationservice.dart';
import 'package:weather/weather/dialog/weather_view_dialog.dart';

class AddCityWidget extends StatelessWidget {
  final List<City> _cities;
  AddCityWidget(this._cities);
  String? _cityName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(child: Text(AppLocalizations.of(context).addCityTitle)),
          TextField(
            cursorColor: Colors.red,
            onChanged: (cityName) {
              _cityName = cityName;
            },
            decoration: new InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
              ),
              labelStyle: new TextStyle(color: Colors.white),
              labelText: AppLocalizations.of(context).cityName,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(height: 30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: Text(
                  AppLocalizations.of(context).cancel,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: 10,
              ),
              Consumer(
                builder: (context, ref, child) {
                  return ElevatedButton(
                    child: Text(
                      AppLocalizations.of(context).addCity,
                    ),
                    onPressed: () async {
                      if (_cityName != null && _cityName!.isNotEmpty) {
                        if (_cities
                            .where((element) => element.name == _cityName)
                            .isNotEmpty) {
                          WeatherDialog.showOkDialog(
                              context,
                              AppLocalizations.of(context).cityNameExistsTitle,
                              AppLocalizations.of(context).cityNameExistsDesc);
                        } else {
                          EasyLoading.show(
                              status: AppLocalizations.of(context)
                                  .cityLoadingStatus);
                          var position = await LocationService.getlocation();

                          ref.read(
                            addCityProvider(
                              City(_cityName!, getNumber(position.latitude),
                                  getNumber(position.longitude)),
                            ),
                          );
                          Navigator.of(context).pop();
                        }
                      } else {
                        WeatherDialog.showOkDialog(
                            context,
                            AppLocalizations.of(context).cityNameEmptyTitle,
                            AppLocalizations.of(context).cityNameEmptyDesc);
                      }
                    },
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  // trim Latitude and longitude to 2 numbers after decimal as the a API wouldn't handle more than 2
  double getNumber(double input, {int precision = 2}) {
    return double.parse(
        '$input'.substring(0, '$input'.indexOf('.') + precision + 1));
  }
}
