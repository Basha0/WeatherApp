import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/main.dart';
import 'package:weather/resources/preference_keys.dart';

// Create a StateNotifier no notify listeners about changes
// For example if a language was chosen
class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier()
      : super(Locale(
            sharedPreferences.getString(PreferenceKeys.languageLocale) ??
                "de"));

  setLocale(
    Locale locale,
  ) {
    state = locale;
  }
}
