import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<LocationServiceErrorHelper> determinePermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    LocationServiceErrorHelper status = LocationServiceErrorHelper.allowed;

    // Check if location service is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      status = LocationServiceErrorHelper.serviceNotEnabled;
    }
    // Check if permissions are granted and if not request them
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        status = LocationServiceErrorHelper.denied;
      }
    }
    // Check if permissions were denied for ever
    if (permission == LocationPermission.deniedForever) {
      status = LocationServiceErrorHelper.deniedForever;
    }
    return status;
  }

  // get location of User
  static Future<Position> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    return position;
  }
}

// Helper to define the permission status and use it to handle which Dialog should be displayed
enum LocationServiceErrorHelper {
  serviceNotEnabled,
  denied,
  deniedForever,
  unableToDetermine,
  allowed
}
