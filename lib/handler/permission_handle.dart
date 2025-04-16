import 'package:permission_handler/permission_handler.dart';

Future<void> requestLocationPermission() async {
  var status = await Permission.location.request();
  if (status.isGranted) {
  } else if (status.isDenied) {
  } else if (status.isPermanentlyDenied) {
    openAppSettings();
  }
}