import 'package:get/get.dart';

class FoodDetailViewModel extends GetxController {
  var isFavorite = false.obs;

  void toggleFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  void addToCart() {
    Get.snackbar(
      "Added to Cart",
      "Item has been added to your cart!",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
