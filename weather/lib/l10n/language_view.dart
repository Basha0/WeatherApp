import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:weather/ressources/constants.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/splash.png", ),
              fit: BoxFit.cover
            )
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: width - 100,
                child:
                    ElevatedButton(onPressed: () {
                      EasyLoading.show();
                    }, child: Text(Constants.german)),
              ),
              Container(
                width: width - 100,
                child:
                    ElevatedButton(onPressed: () {}, child: Text(Constants.english)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
