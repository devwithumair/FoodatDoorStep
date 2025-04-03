import 'package:get/get.dart';

class FoodDetailViewModel extends GetxController {
  var quantity = 1.obs;

  void increaseQuantity() {
    quantity++;
  }

  void decreaseQuantity() {
    if (quantity > 1) quantity--;
  }
}
