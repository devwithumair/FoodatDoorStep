import 'package:footatdoorstep/viewmodels/signup_viewmodel.dart';
import 'package:get/get.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupViewModel>(() => SignupViewModel());
  }
}
