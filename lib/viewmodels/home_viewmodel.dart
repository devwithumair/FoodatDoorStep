import 'package:footatdoorstep/models/food_items.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  var items = <FoodItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFoodItems();
  }

  void loadFoodItems() {
    items.assignAll([
      FoodItem(
        id: '1',
        name: 'Chicken Burger',
        image: 'assets/images/burger.jpg',
        price: 2.0,
        rating: 3.8,
        description: 'Tasty grilled chicken burger',
      ),
      FoodItem(
        id: '2',
        name: 'Chicken Sandwich',
        image: 'assets/images/sandwitch.jpg',
        price: 2.0,
        rating: 3.8,
        description: 'Tasty grilled chicken sandwich',
      ),
      FoodItem(
        id: '3',
        name: 'Chicken Sandwich',
        image: 'assets/images/sandwitch.jpg',
        price: 2.0,
        rating: 3.8,
        description: 'Tasty grilled chicken burger',
      ),
      FoodItem(
        id: '4',
        name: 'Chicken Burger',
        image: 'assets/images/burger.jpg',
        price: 2.0,
        rating: 3.8,
        description: 'Tasty grilled chicken burger',
      ),
      FoodItem(
        id: '5',
        name: 'Chicken Burger',
        image: 'assets/images/burger.jpg',
        price: 2.0,
        rating: 3.8,
        description: 'Tasty grilled chicken burger',
      ),
      FoodItem(
        id: '6',
        name: 'Chicken Sandwich',
        image: 'assets/images/sandwitch.jpg',
        price: 2.0,
        rating: 3.8,
        description: 'Tasty grilled chicken sandwich',
      ),
      FoodItem(
        id: '7',
        name: 'Chicken Sandwich',
        image: 'assets/images/sandwitch.jpg',
        price: 2.0,
        rating: 3.8,
        description: 'Tasty grilled chicken burger',
      ),
      FoodItem(
        id: '8',
        name: 'Chicken Burger',
        image: 'assets/images/burger.jpg',
        price: 2.0,
        rating: 3.8,
        description: 'Tasty grilled chicken burger',
      ),

      // Popular meal menu (5)
      FoodItem(
        id: '9',
        name: 'Papparoni Pizza',
        image: 'assets/images/pizza.jpg',
        price: 15.0,
        rating: 4.7,
        description: '5kg box of Pizza',
      ),
      FoodItem(
        id: '10',
        name: 'Cake',
        image: 'assets/images/cake.jpg',
        price: 15.0,
        rating: 4.7,
        description: '5kg box of cake',
      ),
      FoodItem(
        id: '11',
        name: 'Papparoni Pizza',
        image: 'assets/images/pizza.jpg',
        price: 15.0,
        rating: 4.7,
        description: '5kg box of Pizza',
      ),
      FoodItem(
        id: '12',
        name: 'Cake',
        image: 'assets/images/Cake.jpg',
        price: 15.0,
        rating: 4.7,
        description: '5kg box of cake',
      ),
      FoodItem(
        id: '13',
        name: 'Papparoni Pizza',
        image: 'assets/images/pizza.jpg',
        price: 15.0,
        rating: 4.7,
        description: '5kg box of Pizza',
      ),
    ]);
  }
}
