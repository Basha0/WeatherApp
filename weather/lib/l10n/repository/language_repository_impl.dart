import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Create a StateNotifier no notify listeners about changes
// For example if a language was choosen
class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier() : super(Locale("de"));

  setLocale(
    Locale locale,
  ) {
    state = locale;
  }
}
