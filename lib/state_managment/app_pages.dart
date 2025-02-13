
import 'package:get/get.dart';
import 'package:team1_khayat/features/authintication/view/signup_pages/signup_page.dart';
import 'package:team1_khayat/features/cart/views/cart_view.dart';
import 'package:team1_khayat/state_managment/app_routers.dart';
import '../features/authintication/view/login_pages/login_page.dart';
import '../features/homepage/view/homepage.dart';
import '../features/todo/view/todo_page.dart';
class AppPages {

  static final pages = [
    GetPage(
      name: Routes.signupPage,
      page: () => const SignupPage(),
    ),
    GetPage(
    name: Routes.loginPage,
    page: () => const LoginPage(),
    ),
    GetPage(
      name: Routes.homePage,
      page: () =>  Homepage(),
    ),
    GetPage(
      name: Routes.todoPage,
      page: () => const TodoPage(),
    ),

    //just to test
    GetPage(
      name: Routes.cartPage,
      page: () =>  CartView(),
    ),
];
}