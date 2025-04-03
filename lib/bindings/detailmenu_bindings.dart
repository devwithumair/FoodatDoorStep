import 'package:footatdoorstep/viewmodels/detail_menu_viewmodel.dart';
import 'package:get/get.dart';

class FoodDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodDetailViewModel>(() => FoodDetailViewModel());
  }
}
