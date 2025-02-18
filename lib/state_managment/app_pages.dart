import 'package:get/get.dart';
import 'package:team1_khayat/features/Catalog2/catalog.dart';
import 'package:team1_khayat/features/authintication/view/signup_pages/signup_page.dart';
import 'package:team1_khayat/features/authintication/view/verification_pages/verification_page.dart';
import 'package:team1_khayat/features/cart/views/cart_view.dart';
import 'package:team1_khayat/state_managment/app_routers.dart';
import '../features/authintication/view/login_pages/login_page.dart';
import '../features/homepage/view/homepage.dart';
import '../features/profile/view/details_view.dart';
import '../features/profile/view/my_order_view.dart';
import '../features/profile/view/profile_view.dart';
import '../features/todo/view/todo_page.dart';
import '../shared/bottom_navigation_bar/view/buttom_nav_bar.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.signupPage,
      page: () => SignupPage(),
    ),
    GetPage(
      name: Routes.loginPage,
      page: () =>  LoginPage(),
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
      name: Routes.bottomNavBar,
      page: () => BottomNavBar(),
    ),
    GetPage(
      name: Routes.profileView,
      page: () => ProfileView(),
    ),
    GetPage(
      name: Routes.myOrderView,
      page: () => MyOrderView(),
    ),
    GetPage(
      name: Routes.detailsView,
      page: () => DetailsView(),
    ),
    // GetPage(
    //   name: Routes.catalog_2Page,
    //   page: () => Catalog_2Page(),
    // ),
  ];
}
