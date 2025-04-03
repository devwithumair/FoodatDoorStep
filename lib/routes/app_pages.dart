import 'package:footatdoorstep/bindings/cart_bindings.dart';
import 'package:footatdoorstep/bindings/detailmenu_bindings.dart';
import 'package:footatdoorstep/bindings/location_bindings.dart';
import 'package:footatdoorstep/bindings/onboarding_bindings.dart';
import 'package:footatdoorstep/bindings/ordercompleted_bindings.dart';
import 'package:footatdoorstep/bindings/profile_bindings.dart';
import 'package:footatdoorstep/views/cart_screen.dart';
import 'package:footatdoorstep/views/detail_menu_screen.dart';
import 'package:footatdoorstep/views/location_screen.dart';
import 'package:footatdoorstep/views/ordercompleted_screen.dart';
import 'package:footatdoorstep/views/profile_screen.dart';

import '../bindings/home_bindings.dart';
import '../bindings/login_bindings.dart';
import '../bindings/signup_bindings.dart';
import '../routes/app_routes.dart';
import '../views/home_screen.dart';
import '../views/login_screen.dart';
import '../views/signup_screen.dart';
import 'package:get/get.dart';
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
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => LocationView(),
      binding: LocationBinding(),
    ),
    GetPage(
      name: AppRoutes.chat,
      page: () => OrderCompletedView(),
      binding: OrderCompletedBinding(),
    ),
    GetPage(
      name: AppRoutes.foodDetail,
      page: () => FoodDetailView(foodItem: Get.arguments),
      binding: FoodDetailBinding(),
    ),
  ];
}
