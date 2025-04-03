import 'package:get/get.dart';
import '../routes/app_routes.dart';

class OnBoardingViewModel extends GetxController {
  void goToLogin() {
    Get.toNamed(AppRoutes.login);
  }
}
