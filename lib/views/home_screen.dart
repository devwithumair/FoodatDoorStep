// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:footatdoorstep/viewmodels/home_viewmodel.dart';
// import 'package:footatdoorstep/views/detail_menu_screen.dart';
// import 'package:footatdoorstep/widgets/custom_bottomnavigationbar.dart';
// import 'package:get/get.dart';

// class HomeView extends StatelessWidget {
//   final HomeViewModel controller = Get.put(HomeViewModel());

//   HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.menu, color: Colors.black),
//           onPressed: () {},
//         ),
//         title: Text(
//           'Freedom way, Lekki phase',
//           style: TextStyle(color: Colors.black, fontSize: 16),
//         ),
//         actions: [
//           CircleAvatar(backgroundImage: AssetImage('assets/images/logo.png')),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Search Box
//               TextField(
//                 decoration: InputDecoration(
//                   hintText: 'Search',
//                   prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
//                   filled: true,
//                   fillColor: Colors.white,
//                   contentPadding: EdgeInsets.symmetric(vertical: 14),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide.none,
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: BorderSide(color: Colors.redAccent, width: 2),
//                   ),
//                 ),
//               ),

//               // Carousel Slider
//               Obx(() {
//                 return CarouselSlider(
//                   options: CarouselOptions(height: 150, autoPlay: true),
//                   items:
//                       controller.foodItems.map((item) {
//                         return Container(
//                           margin: EdgeInsets.symmetric(horizontal: 50),
//                           child: Center(
//                             child: Image.asset(
//                               item['image'],
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         );
//                       }).toList(),
//                 );
//               }),

//               // Category Grid
//               Obx(() {
//                 return GridView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 1,
//                     mainAxisSpacing: 20,
//                     crossAxisSpacing: 30,
//                   ),
//                   itemCount: controller.categories.length,
//                   itemBuilder: (context, index) {
//                     var category = controller.categories[index];
//                     return InkWell(
//                       onTap: () {},
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 20),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           height: 100,
//                           width: 300,
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Image.asset(category['image']),
//                                   Text(
//                                     category['name'],
//                                     style: TextStyle(fontSize: 20),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               }),

//               // Food Grid
//               Obx(() {
//                 return GridView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     childAspectRatio: 0.8,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10,
//                   ),
//                   itemCount: controller.foodItems.length,
//                   itemBuilder: (context, index) {
//                     var item = controller.foodItems[index];
//                     return InkWell(
//                       onTap: () {
//                         Get.to(
//                           FoodDetailView(
//                             name: foodItems[index]['name'],
//                             price: foodItems[index]['price'],
//                             imagePath: foodItems[index]['image'],
//                           ),
//                         );
//                       },
//                       child: Card(
//                         elevation: 2,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(item['image']),
//                             SizedBox(height: 10),
//                             Text(
//                               item['name'],
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               item['price'],
//                               style: TextStyle(color: Colors.grey),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//                }
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: CustomBottomNavBar(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:footatdoorstep/viewmodels/home_viewmodel.dart';
import 'package:footatdoorstep/widgets/custom_bottomnavigationbar.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final HomeViewModel controller = Get.put(HomeViewModel());

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Food Items',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          CircleAvatar(backgroundImage: AssetImage('assets/images/logo.png')),
        ],
      ),
      body: Obx(() {
        return ListView(
          children: [
            // Categories Section
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(controller.categories[index].image),
                    Text(controller.categories[index].name),
                  ],
                );
              },
            ),
            // Food Items Section
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: controller.foodItems.length,
              itemBuilder: (context, index) {
                final item = controller.foodItems[index];
                return GestureDetector(
                  onTap: () {
                    // Use Get.to() for routing to the food detail page
                    Get.toNamed('/foodDetail', arguments: item);
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.asset(item.image),
                        Text(item.name),
                        Text(item.price),
                        Text('${item.rating}★'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        );
      }),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
