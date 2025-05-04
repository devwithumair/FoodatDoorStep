// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SignupViewModel extends GetxController {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passController = TextEditingController();

//   Future<String?> signup() async {
//     try {
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passController.text.trim(),
//       );

//       // Clear input fields
//       emailController.clear();
//       passController.clear();

//       return null; // success
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         return 'No user found for that email.';
//       } else if (e.code == 'wrong-password') {
//         return 'Wrong password provided.';
//       } else {
//         return 'An error occurred. Please try again.';
//       }
//     } catch (_) {
//       return 'Something went wrong. Please try again.';
//     }
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupViewModel {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  Future<bool> signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      emailController.clear();
      passController.clear();

      return true; // ✅ Sign-up successful
    } catch (e) {
      return false;
    }
  }
}
