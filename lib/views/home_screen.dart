import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:footatdoorstep/views/fooddetail_screen.dart';
import 'package:get/get.dart';
import '../viewmodels/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeViewModel()); // Ensures it's initialized

    return Scaffold(
      // bottomNavigationBar: BottomNavBar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Food Items',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: const [
          CircleAvatar(backgroundImage: AssetImage('assets/images/logo.png')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search food items...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              const SizedBox(height: 20),

              // Carousel
              CarouselSlider(
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                ),
                items:
                    [
                      'assets/images/burger.jpg',
                      'assets/images/burger.jpg',
                      'assets/images/burger.jpg',
                    ].map((imgPath) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          imgPath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      );
                    }).toList(),
              ),
              const SizedBox(height: 20),

              // Main Items Grid
              Obx(
                () => Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children:
                      controller.items.take(8).map((item) {
                        return GestureDetector(
                          onTap: () => Get.to(() => FoodDetailView(item: item)),
                          child: SizedBox(
                            width: (MediaQuery.of(context).size.width - 36) / 2,
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Image.asset(item.image, width: 60),
                                    const SizedBox(height: 10),
                                    Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text('\$${item.price.toStringAsFixed(2)}'),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 16,
                                        ),
                                        Text(item.rating.toString()),
                                      ],
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                      style: IconButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        shape: const CircleBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Popular Meal Menu',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text('See all', style: TextStyle(color: Colors.green)),
                ],
              ),
              const SizedBox(height: 10),

              // Popular Meals Section (Safe Version)
              Obx(() {
                final popularItems =
                    controller.items.length > 8
                        ? controller.items.sublist(
                          8,
                          controller.items.length.clamp(9, 13),
                        )
                        : [];

                if (popularItems.isEmpty) {
                  return const SizedBox();
                }

                return Column(
                  children:
                      popularItems.map((item) {
                        return GestureDetector(
                          onTap: () => Get.to(() => FoodDetailView(item: item)),
                          child: Card(
                            color: const Color(0xFFFDEBFA),
                            child: ListTile(
                              leading: Image.asset(item.image, width: 40),
                              title: Text(
                                item.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(item.description),
                              trailing: Text(
                                '\$${item.price}',
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
