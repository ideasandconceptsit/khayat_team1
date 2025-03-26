import 'package:get/get.dart';
import 'package:team1_khayat/features/Catalog2/catalog.dart';
import 'package:team1_khayat/features/appointment/views/appointment_view.dart';
import 'package:team1_khayat/features/authintication/view/signup_pages/signup_page.dart';
import 'package:team1_khayat/features/authintication/view/verification_pages/verification_page.dart';
import 'package:team1_khayat/features/cart/views/cart/cart_view.dart';
import 'package:team1_khayat/features/cart/views/checkout/checkout_view.dart';
import 'package:team1_khayat/features/cart/views/payment/payment_view.dart';
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
      name: Routes.appointmentPage,
      page: () =>  AppointmentView(),
    ),
    GetPage(
      name: Routes.checkoutPage,
      page: () =>  CheckoutView(
      ),
    ),
    GetPage(
      name: Routes.paymentPage,
      page: () => const PaymentView(),
    ),
  ];
}
