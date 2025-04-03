import 'package:footatdoorstep/models/category_model.dart';
import 'package:footatdoorstep/models/fooditems_model.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  var categories =
      <Category>[
        Category(name: 'Burger', image: 'assets/images/burger.jpg'),
        Category(name: 'Pizza', image: 'assets/images/pizza.jpg'),
      ].obs;

  var foodItems =
      <FoodItem>[
        FoodItem(
          name: 'Chicken Burger',
          price: '\$2.00',
          rating: 3.8,
          image: 'assets/images/burger1.jpg',
        ),
        FoodItem(
          name: 'Cheese Burger',
          price: '\$1.50',
          rating: 4.5,
          image: 'assets/images/burger1.jpg',
        ),
      ].obs;
}
