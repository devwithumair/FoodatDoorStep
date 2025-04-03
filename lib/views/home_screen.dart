import 'package:flutter/material.dart';
import 'package:footatdoorstep/widgets/custom_bottomnavigationbar.dart';
import 'package:get/get.dart';
import '../viewmodels/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewModel controller = Get.find<HomeViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Freedom way, Lekki phase',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          CircleAvatar(backgroundImage: AssetImage('assets/images/logo.png')),
        ],
      ),
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: [
            _buildHomeScreen(controller),
            Container(), // Profile screen placeholder
            Container(), // Cart screen placeholder
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  Widget _buildHomeScreen(HomeViewModel controller) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: controller.foodItems.length, // ✅ No more error!
            itemBuilder: (context, index) {
              final item = controller.foodItems[index];
              return GestureDetector(
                onTap: () => controller.navigateToFoodDetail(item),
                child: Card(
                  child: Column(
                    children: [
                      Image.asset(item["image"]),
                      Text(item['name']),
                      Text("\$${item['price']}"),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
