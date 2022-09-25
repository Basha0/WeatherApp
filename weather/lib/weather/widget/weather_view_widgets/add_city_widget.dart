import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/available_cities/models/city_model.dart';
import 'package:weather/database/providers/hive_db_providers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AddCityWidget extends StatelessWidget {
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
                    onPressed: () {
                      if (_cityName != null && _cityName!.isNotEmpty) {
                        EasyLoading.show(
                            status:
                                AppLocalizations.of(context).cityLoadingStatus);
                        ref.read(addCityProvider(City(_cityName!, 23, 23)));

                        Navigator.pop(context);
                      } else {
                        showDialog(
                          context: context,
                          builder: (con) => AlertDialog(
                            title: Text(AppLocalizations.of(context)
                                .cityNameEmptyTitle),
                            content: Text(
                                AppLocalizations.of(context).cityNameEmptyDesc),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text(AppLocalizations.of(context).ok),
                              ),
                            ],
                          ),
                        );
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
}
