import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/l10n/language_prviders/language_provider.dart';
import 'package:weather/main.dart';
import 'package:weather/ressources/constants.dart';
import 'package:weather/ressources/prefrence_keys.dart';

class LanguageScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        // background Image of language screen
        SvgPicture.asset(
          "assets/splash.svg",
          fit: BoxFit.cover,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width - 100,
                child: ElevatedButton(
                    onPressed: () {
                      setLanguage(ref, "de");
                    },
                    child: Text(Constants.german)),
              ),
              Container(
                width: width - 100,
                child: ElevatedButton(
                    onPressed: () {
                      setLanguage(ref, "en");
                    },
                    child: Text(Constants.english)),
              ),
            ],
          ),
        )
      ],
    );
  }

  // set language that was choosen and save it to the app preferences
  setLanguage(WidgetRef ref, String language) async {
    await sharedPreferences.setBool(PreferenceKeys.languageIsSet, true);
    ref.read(languageProvider.notifier).setLocale(Locale(language));
  }
}
