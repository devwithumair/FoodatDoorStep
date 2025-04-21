import 'package:flutter/material.dart';
import 'package:footatdoorstep/viewmodels/navbar_viewmodel.dart';
import 'package:footatdoorstep/views/cart_screen.dart';
import 'package:footatdoorstep/views/home_screen.dart';
import 'package:footatdoorstep/views/profile_screen.dart';
import 'package:footatdoorstep/widgets/custom_bottomnavigationbar.dart';
import 'package:get/get.dart';

// views/main_view.dart
class MainView extends StatelessWidget {
  final NavController controller = Get.find();

  final List<Widget> pages = [
    HomeView(),
    ProfileView(),
    CartView(),
  ];

  final List<String> appBarTitles = ['Home', 'Profile', 'My Cart'];

  MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(appBarTitles[controller.selectedIndex.value]),
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
          ),
          body: pages[controller.selectedIndex.value],
          bottomNavigationBar: CustomNavBar(),
        ));
  }
}

