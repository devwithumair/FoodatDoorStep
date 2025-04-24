import 'package:footatdoorstep/models/cart_items.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  var cartItems = <CartItemModel>[].obs;

  void addToCart(CartItemModel newItem) {
    final index = cartItems.indexWhere((item) => item.id == newItem.id);
    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(newItem);
    }
  }

  void removeFromCart(String id) {
    cartItems.removeWhere((item) => item.id == id);
  }

  void increaseQuantity(String id) {
    final index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      cartItems[index].quantity++;
    }
  }

  void decreaseQuantity(String id) {
    final index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1 && cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
    } else {
      removeFromCart(id);
    }
  }

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);
}
