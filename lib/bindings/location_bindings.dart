import 'package:footatdoorstep/viewmodels/location_viewmodel.dart';
import 'package:get/get.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocationViewModel>(() => LocationViewModel());
  }
}
