import 'package:get/get.dart';

class ProfileViewModel extends GetxController {
  var switchValue = false.obs; // State management for switch toggle

  void toggleSwitch(bool value) {
    switchValue.value = value;
  }
}
