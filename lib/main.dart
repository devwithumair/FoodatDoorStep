import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:footatdoorstep/firebase_options.dart';
import 'package:footatdoorstep/routes/app_pages.dart';
import 'package:footatdoorstep/routes/app_routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
    );
  }
}
