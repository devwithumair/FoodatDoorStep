import 'package:footatdoorstep/bindings/bottomnav_bindings.dart';
import 'package:footatdoorstep/bindings/cart_bindings.dart';
import 'package:footatdoorstep/bindings/ordercompleted_bindings.dart';
import 'package:footatdoorstep/routes/app_routes.dart';
import 'package:footatdoorstep/views/bottom_nav_screen.dart';
import 'package:footatdoorstep/views/cart_screen.dart';
import 'package:footatdoorstep/views/order_completed_screen.dart';
import 'package:footatdoorstep/views/profile_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../bindings/home_bindings.dart';
import '../bindings/login_bindings.dart';
import '../bindings/signup_bindings.dart';
import '../bindings/onboarding_bindings.dart';
import '../views/home_screen.dart';
import '../views/login_screen.dart';
import '../views/signup_screen.dart';
import '../views/splash_screen.dart';
import '../views/onboarding_screen.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => SplashScreen()),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => OnBoarding(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.bottomNav,
      page: () => BottomNavScreen(),
      binding: BottomNavBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(name: AppRoutes.profile, page: () => ProfileView()),
    GetPage(
      name: AppRoutes.cart,
      page: () => CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: AppRoutes.ordercompleted,
      page: () => OrderCompletedView(),
      binding: OrderCompletedBinding(),
    ),
  ];
}
