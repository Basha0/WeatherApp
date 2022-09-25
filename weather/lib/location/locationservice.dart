import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<LocationServiceErrorHelper> determinePermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    LocationServiceErrorHelper status = LocationServiceErrorHelper.allowed;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      status = LocationServiceErrorHelper.serviceNotEnabled;
      return status;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        status = LocationServiceErrorHelper.denied;
        return status;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      status = LocationServiceErrorHelper.deniedForever;
      return status;
    }
    status = LocationServiceErrorHelper.allowed;
    return status;
  }

  static Future<Position> getlocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    return position;
  }
}

enum LocationServiceErrorHelper {
  serviceNotEnabled,
  denied,
  deniedForever,
  unableToDetermine,
  allowed
}
