import 'package:weather/available_cities/models/city_model.dart';

enum AvaiableCity {
  mainz,
  darmstadt,
  wiesbaden,
  frankfurt,
}

enum AllCities { allCities }

// Add predefined Cities 
extension AllCitiesExtension on AllCities {
  List<City> get allCities {
    AvaiableCity.values.forEach((cityItem) {
      String name;
      double lat;
      double long;
      switch (cityItem) {
        case AvaiableCity.mainz:
          name = "Mainz";
          lat = 49.99;
          long = 8.24;
          break;
        case AvaiableCity.darmstadt:
          name = "Darmstadt";
          lat = 49.87;
          long = 8.65;
          break;
        case AvaiableCity.wiesbaden:
          name = "Wiesbaden";
          lat = 50.07;
          long = 8.23;
          break;
        case AvaiableCity.frankfurt:
          name = "Frankfurt";
          lat = 50.11;
          long = 8.68;
          break;
      }
      allCities.add(City(name, lat, long));
    });

    return allCities;
  }
}
