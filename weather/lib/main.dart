import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/database/services/hive_service.dart';
import 'package:weather/l10n/l10n.dart';
import 'package:weather/l10n/language_providers/language_provider.dart';
import 'package:weather/l10n/view/language_view.dart';
import 'package:weather/resources/preference_keys.dart';
import 'package:weather/themes/appThemes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather/weather/view/weather_view.dart';

// make Singletons global variables
late SharedPreferences sharedPreferences;

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initializeSingletons();
  initializeEasyLoading();
  await initHiveDataBase();
  FlutterNativeSplash.remove();
  runApp(
    // add ProviderScope to store state of providers
    ProviderScope(
      // rebuild app when language changes
      child: Consumer(
        builder: (context, ref, child) {
          // set new language
          final locale = ref.watch(languageProvider) as Locale;
          //check if language was already set
          bool languageIsSet =
              sharedPreferences.getBool(PreferenceKeys.languageIsSet) ?? false;
          return MaterialApp(
            locale: locale,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: EasyLoading.init(),
            supportedLocales: L10n.all,
            theme: AppThemes.buildDarkTheme(),
            home: languageIsSet ? WeatherView() : LanguageScreen(false),
          );
        },
      ),
    ),
  );
}

// initialize EasyLoading and customize it
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


// initialize Hive
initHiveDataBase() async {
  await HiveService.init();
}

// initialize Shared preferences singleton to access from whole app
initializeSingletons() async {
  sharedPreferences = await SharedPreferences.getInstance();
  await Future.delayed(Duration(milliseconds: 500));
}
