import 'dart:async';
import 'package:get/get.dart';
import '../routes/app_routes.dart'; // Define route names here

class SplashViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.onboarding); // Navigate using GetX
    });
  }
}
