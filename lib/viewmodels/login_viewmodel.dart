import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:footatdoorstep/views/bottom_nav_screen.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  var message = ''.obs; // Reactive message variable

  Future<void> login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      // Clear input fields
      emailController.clear();
      passController.clear();

      // Navigate to HomeView
      Get.offAll(() => BottomNavScreen());

      // Success message
      message.value = 'Logged in successfull!'; // Update message
    } on FirebaseAuthException catch (e) {
      String msg = 'An error occurred';
      if (e.code == 'user-not-found') {
        msg = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        msg = 'Wrong password provided.';
      }

      // Show error message
      message.value = msg; // Update message on error
    }
  }
}
