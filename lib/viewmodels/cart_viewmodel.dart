import 'package:footatdoorstep/models/cart_model.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  var cartItems =
      <CartItem>[
        CartItem(
          name: "Pizza Spicy",
          restaurant: "Burger Factory LTD",
          price: 20,
          image: "assets/images/pizza.jpg",
          quantity: 1,
        ),
        CartItem(
          name: "Pizza Spicy",
          restaurant: "Burger Factory LTD",
          price: 20,
          image: "assets/images/pizza.jpg",
          quantity: 1,
        ),
        CartItem(
          name: "Pizza Spicy",
          restaurant: "Burger Factory LTD",
          price: 20,
          image: "assets/images/pizza.jpg",
          quantity: 1,
        ),
      ].obs;

  // Get total price
  double get total =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  // Increment item quantity
  void incrementQuantity(int index) {
    cartItems[index].quantity++;
    cartItems.refresh();
  }

  // Decrement item quantity
  void decrementQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
      cartItems.refresh();
    }
  }
}
