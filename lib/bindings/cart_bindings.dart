import 'package:footatdoorstep/viewmodels/cart_viewmodel.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartViewModel>(() => CartViewModel());
  }
}