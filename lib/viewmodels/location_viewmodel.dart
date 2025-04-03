import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class LocationViewModel extends GetxController {
  var currentLocation = LatLng(6.5244, 3.3792).obs; // Default position (Lagos)

  void updateLocation(LatLng newLocation) {
    currentLocation.value = newLocation;
  }
}
