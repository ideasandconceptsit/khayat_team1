import 'package:get/get.dart';
import 'package:team1_khayat/features/Catalog2/catalog.dart';
import 'package:team1_khayat/features/Catalog2/choice_page.dart';
import 'package:team1_khayat/features/authintication/view/signup_pages/signup_page.dart';
import 'package:team1_khayat/features/authintication/view/verification_pages/verification_page.dart';
import 'package:team1_khayat/features/cart/views/cart_view.dart';
import 'package:team1_khayat/features/favorites/favorites_page.dart';
import 'package:team1_khayat/features/favorites/models/favorite_model.dart';
import 'package:team1_khayat/features/shipping_address/views/shipping_address_page.dart';
import 'package:team1_khayat/state_managment/app_routers.dart';
import '../features/authintication/view/login_pages/login_page.dart';
import '../features/homepage/view/homepage.dart';
import '../features/todo/view/todo_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.signupPage,
      page: () => SignupPage(),
    ),
    GetPage(
      name: Routes.loginPage,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.verificationPage,
      page: () => const VerificationPage(),
    ),
    GetPage(
      name: Routes.homePage,
      page: () => Homepage(),
    ),
    GetPage(
      name: Routes.catalog_2Page,
      page: () => const CatalogPage(),
    ),
    GetPage(
      name: Routes.cartPage,
      page: () => CartView(),
    ),
    GetPage(
      name: Routes.shippingAddressPage,
      page: () => ShippingAddressesPage(),
    ),
    GetPage(
      name: Routes.favoritePage,
      page: () => const FavoritesPage(),
    ),
    GetPage(
      name: Routes.choicePage,
      page: () => ChoiceScreen(),
    ),
  ];
}
