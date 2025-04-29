import 'package:footatdoorstep/viewmodels/ordercompleted_viewmodel.dart';
import 'package:get/get.dart';

class OrderCompletedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderCompletedViewModel());
  }
}
