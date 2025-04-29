import 'package:get/get.dart';

class OrderCompletedViewModel extends GetxController {
  void skip() {
    Get.offAllNamed('/bottomNav');
  }
}
