import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OrderCompletedViewModel extends GetxController {
  var rating = 0.obs;
  TextEditingController feedbackController = TextEditingController();

  void submitFeedback() {
    if (feedbackController.text.isNotEmpty) {
      Get.snackbar(
        "Feedback Submitted",
        "Thank you for your feedback!",
        snackPosition: SnackPosition.BOTTOM,
      );
      feedbackController.clear();
    } else {
      Get.snackbar(
        "Feedback Required",
        "Please enter feedback before submitting.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void setRating(int value) {
    rating.value = value;
  }
}
