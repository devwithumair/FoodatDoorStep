// // ignore_for_file: unused_local_variable

// import 'package:flutter/material.dart';
// import 'package:footatdoorstep/viewmodels/detail_menu_viewmodel.dart';
// import 'package:get/get.dart';
// import '../routes/app_routes.dart';

// class FoodDetailView extends StatelessWidget {
//   const FoodDetailView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final FoodDetailViewModel controller = Get.find();

//     // Retrieve arguments from GetX navigation
//     final Map<String, dynamic> args = Get.arguments ?? {};
//     final String name = args['name'] ?? 'Food Item';
//     final String price = args['price'] ?? '0.00';
//     final String imagePath = args['imagePath'] ?? 'assets/images/default.png';

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 Image.asset(
//                   imagePath,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                   height: 400,
//                 ),
//                 Positioned(
//                   top: 40,
//                   left: 16,
//                   child: CircleAvatar(
//                     backgroundColor: Colors.white,
//                     child: IconButton(
//                       icon: const Icon(Icons.arrow_back),
//                       onPressed: () => Get.offNamed(AppRoutes.home),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                           vertical: 5,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.pink[100],
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: const Text(
//                           'Popular',
//                           style: TextStyle(
//                             color: Colors.pink,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       const Spacer(),
//                       Obx(
//                         () => IconButton(
//                           icon: Icon(
//                             controller.isFavorite.value
//                                 ? Icons.favorite
//                                 : Icons.favorite_border,
//                             color:
//                                 controller.isFavorite.value
//                                     ? Colors.red
//                                     : Colors.grey,
//                           ),
//                           onPressed: controller.toggleFavorite,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     name,
//                     style: const TextStyle(
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     children: const [
//                       Icon(Icons.star, color: Colors.yellow),
//                       SizedBox(width: 5),
//                       Text('4.8 Rating', style: TextStyle(color: Colors.grey)),
//                       SizedBox(width: 10),
//                       Icon(Icons.shopping_bag, color: Colors.grey),
//                       SizedBox(width: 5),
//                       Text('7000+ Order', style: TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                   const SizedBox(height: 15),
//                   const Text(
//                     'In a medium bowl, add ground chicken, breadcrumbs, mayonnaise, onions, parsley, garlic, paprika, salt, and pepper. Use your hands to combine all the ingredients together until blended, but don’t over mix.',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.pink,
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       onPressed: controller.addToCart,
//                       child: const Text(
//                         'Add To Cart',
//                         style: TextStyle(fontSize: 18, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:footatdoorstep/models/fooditems_model.dart';
import 'package:footatdoorstep/viewmodels/detail_menu_viewmodel.dart';
import 'package:footatdoorstep/views/cart_screen.dart';
import 'package:get/get.dart';

class FoodDetailView extends StatelessWidget {
  final FoodItem foodItem;
  final FoodDetailViewModel controller = Get.put(FoodDetailViewModel());

  FoodDetailView({super.key, required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(foodItem.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(foodItem.image),
            Text(foodItem.name),
            Text(foodItem.price),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: controller.decreaseQuantity,
                ),
                Obx(() => Text('${controller.quantity}')),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: controller.increaseQuantity,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => CartView());
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
