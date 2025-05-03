import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupViewModel extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  // var message = ''.obs; // Reactive message variable

  Future<void> signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      // Clear input fields
      emailController.clear();
      passController.clear();

      /// Optionally show success snackbar
      Get.snackbar(
        'Success',
        'Account created successfully!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } on FirebaseAuthException catch (e) {
      String msg = 'An error occurred';
      if (e.code == 'email-already-in-use') {
        msg = 'The email address is already in use by another account.';
      }

      // Show error snackbar
      Get.snackbar(
        'Signup Failed',
        msg,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
