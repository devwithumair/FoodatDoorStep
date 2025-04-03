import 'package:flutter/material.dart';
import 'package:footatdoorstep/views/cart_screen.dart';
import 'package:footatdoorstep/views/home_screen.dart';
import 'package:footatdoorstep/views/profile_screen.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  var currentIndex = 0.obs;

  final List<Widget> screens = [
    const HomeView(),
    const ProfileView(),
    const CartView(),
  ];

  final List<Map<String, dynamic>> foodItems = [
    {
      'name': 'Chicken Burger',
      'price': '12.99',
      'image': 'assets/images/burger1.jpg',
    },
    {
      'name': 'Cheese Burger',
      'price': '10.50',
      'image': 'assets/images/burger2.jpg',
    },
  ];

  void changeTab(int index) {
    currentIndex.value = index;
  }

  void navigateToFoodDetail(Map<String, dynamic> foodItem) {
    Get.toNamed(
      '/foodDetail',
      arguments: {
        'name': foodItem['name'],
        'price': foodItem['price'],
        'imagePath': foodItem['image'],
      },
    );
  }

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
