// import 'package:flutter/material.dart';
// import 'package:footatdoorstep/viewmodels/login_viewmodel.dart';
// import 'package:footatdoorstep/views/signup_screen.dart';
// import 'package:get/get.dart';

// class LoginView extends StatelessWidget {
//   LoginView({super.key});

//   final LoginViewModel viewModel = Get.put(LoginViewModel());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const SizedBox(height: 40),
//             Image.asset('assets/images/onboarding.jpg', height: 200),
//             const SizedBox(height: 20),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       TextButton(
//                         onPressed: () => Get.to(() => SignupView()),
//                         child: const Text(
//                           'Create Account',
//                           style: TextStyle(fontSize: 18, color: Colors.black54),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () => Get.to(() => LoginView()),
//                         child: const Text(
//                           'Login',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black54,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   TextField(
//                     controller: viewModel.emailController,
//                     decoration: const InputDecoration(
//                       labelText: 'Email address',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   TextField(
//                     controller: viewModel.passController,
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       labelText: 'Password',
//                       border: OutlineInputBorder(),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: viewModel.login,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.pink,
//                       minimumSize: const Size(double.infinity, 50),
//                     ),
//                     child: const Text(
//                       'Log In',
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   const SizedBox(height: 10),

//                   // Obx(() {
//                   //   if (viewModel.message.value.isNotEmpty) {
//                   //     return Padding(
//                   //       padding: const EdgeInsets.all(8.0),
//                   //       child: Text(
//                   //         viewModel.message.value,
//                   //         style: TextStyle(
//                   //           color:
//                   //               viewModel.message.value.contains('success')
//                   //                   ? Colors.green
//                   //                   : Colors.red,
//                   //           fontWeight: FontWeight.bold,
//                   //           fontSize: 16,
//                   //         ),
//                   //       ),
//                   //     );
//                   //   }
//                   //   return Container(); // Empty container if no message
//                   // }),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:footatdoorstep/viewmodels/login_viewmodel.dart';
import 'package:footatdoorstep/views/signup_screen.dart';
import 'package:footatdoorstep/views/bottom_nav_screen.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginViewModel viewModel = Get.put(LoginViewModel());
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: scaffoldMessengerKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset('assets/images/onboarding.jpg', height: 200),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Get.to(() => SignupView()),
                          child: const Text(
                            'Create Account',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Get.to(() => LoginView()),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
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
                      onPressed: () async {
                        final error = await viewModel.login();
                        if (error != null) {
                          scaffoldMessengerKey.currentState?.showSnackBar(
                            SnackBar(
                              content: Text(error),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          scaffoldMessengerKey.currentState?.showSnackBar(
                            const SnackBar(
                              content: Text('Login successful!'),
                              backgroundColor: Colors.green,
                            ),
                          );

                          // Allow user to see success message briefly
                          await Future.delayed(const Duration(seconds: 1));
                          Get.offAll(() => BottomNavScreen());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text(
                        'Log In',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
