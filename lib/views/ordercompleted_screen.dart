import 'package:flutter/material.dart';
import 'package:footatdoorstep/viewmodels/ordercompleted_viewmodel.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';

class OrderCompletedView extends StatelessWidget {
  const OrderCompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderCompletedViewModel controller = Get.find();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Check Mark
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: const Icon(Icons.check, color: Colors.white, size: 50),
            ),
            const SizedBox(height: 20),

            // Thank You Text
            const Text(
              "Thank You!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Order Completed",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Rate Your Driver Text
            const Text(
              "Please rate your last driver",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Star Rating
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return GestureDetector(
                    onTap: () => controller.setRating(index + 1),
                    child: Icon(
                      index < controller.rating.value
                          ? Icons.star
                          : Icons.star_border,
                      color:
                          index < controller.rating.value
                              ? Colors.orange
                              : Colors.grey,
                      size: 30,
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),

            // Feedback Text Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: controller.feedbackController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.edit, color: Colors.red),
                  hintText: "Leave feedback",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Submit & Skip Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Submit Button
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: controller.submitFeedback,
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                // Skip Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.home);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
