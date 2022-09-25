import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier() : super(Locale("de"));

  setLocale(
    Locale locale,
  ) {
    state = locale;
  }
}
