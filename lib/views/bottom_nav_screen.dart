import 'package:flutter/material.dart';
import 'package:footatdoorstep/viewmodels/navbar_viewmodel.dart';
import 'package:footatdoorstep/views/cart_screen.dart';
import 'package:footatdoorstep/views/home_screen.dart';
import 'package:footatdoorstep/views/profile_screen.dart';
import 'package:footatdoorstep/widgets/custom_bottomnavigationbar.dart';
import 'package:get/get.dart';

class BottomNavScreen extends StatelessWidget {
  BottomNavScreen({super.key});

  final NavController controller = Get.put(NavController());

  final List<Widget> screens = [HomeView(), ProfileView(), CartView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screens[controller.selectedIndex.value]),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
