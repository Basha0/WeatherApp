import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/database/hive_database-service.dart';
import 'package:weather/database/hive_service.dart';
import 'package:weather/l10n/l10n.dart';
import 'package:weather/l10n/language_view.dart';
import 'package:weather/ressources/prefrence_keys.dart';
import 'package:weather/themes/appThemes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather/weather/widget/weather_widget.dart';

// make Singletons global variables
late HiveService hiveService;
late HiveDatabase hiveDatabase;
late SharedPreferences sharedPreferences;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initializeSingletons();
  initializeEasyLoading();
  FlutterNativeSplash.remove();
  bool isLanguageSet =
      sharedPreferences.getBool(PreferenceKeys.languageIsSet) ?? false;
  runApp(
    // add ProviderScope to store state of providers
    ProviderScope(
      child: MaterialApp(
        locale: isLanguageSet
            ? Locale(
                sharedPreferences.getString(PreferenceKeys.languageLocale)!)
            : Locale("de"),
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        builder: EasyLoading.init(),
        supportedLocales: L10n.all,
        theme: AppThemes.buildDarkTheme(),
        home: isLanguageSet ? WeatherWidget() : LanguageScreen(),
      ),
    ),
  );
}

initializeEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.ring
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 50.0
    ..radius = 10.0
    ..userInteractions = false
    ..progressColor = Colors.white
    ..backgroundColor = Colors.blueGrey
    ..indicatorColor = Colors.blue
    ..textColor = Colors.white
    ..dismissOnTap = false;
}

initializeSingletons() async {
  sharedPreferences = await SharedPreferences.getInstance();
  await Future.delayed(Duration(milliseconds: 500));
  hiveService = HiveService.getInstance();
  hiveDatabase = HiveDatabase.getInstance();
}
