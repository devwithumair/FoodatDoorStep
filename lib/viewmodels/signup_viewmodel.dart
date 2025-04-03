import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupViewModel extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  var message = ''.obs; // Reactive message variable

  Future<void> signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      // Clear input fields
      emailController.clear();
      passController.clear();

      // Success message
      message.value = 'Account created successfully!'; // Update message
    } on FirebaseAuthException catch (e) {
      String msg = 'An error occurred';
      if (e.code == 'email-already-in-use') {
        msg = 'The email address is already in use by another account.';
      }

      // Show error message
      message.value = msg; // Update message on error
    }
  }
}
