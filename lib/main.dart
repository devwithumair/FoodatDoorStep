import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footatdoorstep/firebase_options.dart';
import 'package:footatdoorstep/routes/app_pages.dart';
import 'package:footatdoorstep/routes/app_routes.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Define one global key for ScaffoldMessengerState
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ECommerce Food App',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      scaffoldMessengerKey: scaffoldMessengerKey, // Set it here globally
      // initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
