import 'package:flutter/material.dart';
import 'package:footatdoorstep/viewmodels/signup_viewmodel.dart';
import 'package:footatdoorstep/views/login_screen.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget {
  SignupView({super.key});

  final SignupViewModel viewModel = Get.put(SignupViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Image.asset('assets/images/onboarding.jpg', height: 200),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Get.to(() => LoginView()),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: viewModel.emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: viewModel.passController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: viewModel.signup,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Display message here (if any)
                  // Obx(() {
                  //   if (viewModel.message.value.isNotEmpty) {
                  //     return Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: Text(
                  //         viewModel.message.value,
                  //         style: TextStyle(
                  //           color:
                  //               viewModel.message.value.contains('success')
                  //                   ? Colors.green
                  //                   : Colors.red,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 16,
                  //         ),
                  //       ),
                  //     );
                  //   }
                  //   return Container(); // Empty container if no message
                  // }
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
