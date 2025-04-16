import 'package:dreamapp/handler/permission_handle.dart';
import 'package:geolocator/geolocator.dart';

Future<Position?> getCurrentLocation() async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return null;
  }

  await requestLocationPermission();

  return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
}