import 'package:flutter/material.dart';
import 'package:footatdoorstep/viewmodels/navbar_viewmodel.dart';
import 'package:get/get.dart';

class CustomNavBar extends StatelessWidget {
  final NavController controller = Get.find();

  final List<IconData> icons = [Icons.home, Icons.person, Icons.shopping_cart];
  final List<String> labels = ['Home', 'Profile', 'Cart'];

  CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: Colors.grey.shade100,
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(icons.length, (index) {
              final isSelected = controller.selectedIndex.value == index;
              return MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => controller.changeIndex(index),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue.shade100 : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(icons[index], color: isSelected ? Colors.blue : Colors.grey),
                        SizedBox(height: 4),
                        Text(
                          labels[index],
                          style: TextStyle(
                            color: isSelected ? Colors.blue : Colors.grey,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ));
  }
}