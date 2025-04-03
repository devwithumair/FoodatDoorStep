import 'package:footatdoorstep/viewmodels/onboarding_viewmodel.dart';
import 'package:get/get.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingViewModel>(() => OnBoardingViewModel());
  }
}
