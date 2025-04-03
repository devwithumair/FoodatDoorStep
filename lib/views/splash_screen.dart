import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../viewmodels/splash_viewmodel.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashViewModel controller = Get.put(SplashViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 235, 193, 193),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset('assets/images/logo.png'),
              Image.asset('assets/images/name.png'),
            ],
          ),
        ),
      ),
    );
  }
}
