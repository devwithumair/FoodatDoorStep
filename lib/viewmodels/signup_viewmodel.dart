import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignupViewModel extends GetxController {
  var emailController = ''.obs;
  var passController = ''.obs;
  var nameController = ''.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.value.trim(),
        password: passController.value.trim(),
      );

      // Clear input fields
      emailController.value = '';
      passController.value = '';
      nameController.value = '';

      // Show success message
      Get.snackbar(
        'Success',
        'User Successfully Registered',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.primaryColor,
        colorText: Get.theme.colorScheme.onPrimary,
      );

      // Navigate to login
      Get.offAllNamed('/login');
    } on FirebaseAuthException catch (e) {
      String message = 'An error occurred';

      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      }

      Get.snackbar(
        'Error',
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.colorScheme.error,
        colorText: Get.theme.colorScheme.onError,
      );
    }
  }
}
