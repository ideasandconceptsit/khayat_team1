import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/Catalog2/catalog.dart';
import 'package:team1_khayat/features/Catalog2/choice_page.dart';
import 'package:team1_khayat/features/appointment/views/appointment_view.dart';
import 'package:team1_khayat/features/authintication/view/signup_pages/signup_page.dart';
import 'package:team1_khayat/features/authintication/view/verification_pages/verification_page.dart';
import 'package:team1_khayat/features/cart/views/cart/cart_view.dart';
import 'package:team1_khayat/features/cart/views/checkout/checkout_view.dart';
import 'package:team1_khayat/features/cart/views/payment/payment_view.dart';
import 'package:team1_khayat/features/favorites/favorites_page.dart';
import 'package:team1_khayat/features/main2/views/main2_view.dart';
import 'package:team1_khayat/features/product/views/product_view.dart';
import 'package:team1_khayat/features/profile/view/forget_password_view.dart';
import 'package:team1_khayat/features/profile/view/order_details_view.dart';
import 'package:team1_khayat/features/profile/view/setting_view.dart';
import 'package:team1_khayat/features/shipping_address/views/shipping_address_page.dart';
import 'package:team1_khayat/features/splash_modules/slider/slider.dart';
import 'package:team1_khayat/state_managment/app_routers.dart';
import '../features/authintication/view/login_pages/login_page.dart';
import '../features/homepage/view/homepage.dart';
import '../features/profile/view/my_order_view.dart';
import '../features/profile/view/profile_view.dart';
import '../features/profile/view/rating_view.dart';
import '../features/todo/view/todo_page.dart';
import '../shared/bottom_navigation_bar/view/buttom_nav_bar.dart';
import '../features/product/models/base_product_model.dart';

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
      name: Routes.shippingAddressPage,
      page: () => ShippingAddressesPage(),
    ),
    GetPage(
      name: Routes.cartPage,
      page: () => CartView(),
    ),
    GetPage(
      name: Routes.appointmentPage,
      page: () => AppointmentView(),
    ),
    GetPage(
      name: Routes.checkoutPage,
      page: () => CheckoutView(),
    ),
    GetPage(
      name: Routes.paymentPage,
      page: () => const PaymentView(),
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
      page: () => OrderDetailsView(),
    ),
    GetPage(
      name: Routes.favoritePage,
      page: () => const FavoritesPage(),
    ),
    GetPage(
      name: Routes.choicePage,
      page: () => ChoiceScreen(),
    ),
    GetPage(
      name: Routes.settingView,
      page: () => SettingView(),
    ),
    GetPage(
      name: Routes.reviewAndRatingScreen,
      page: () => ReviewAndRatingView(),
    ),
    GetPage(
      name: Routes.splashscreen,
      page: () => slider(),
    ),
    // GetPage(
    //   name: Routes.RatingReviewsPage,
    //   page: () => RatingReviewsPage(),
    // ),
    GetPage(
      name: Routes.productCardPage,
      page: () => ProductCardView(),
    ),
    GetPage(
      name: Routes.main2,
      page: () =>    Main2(),
    ),
    GetPage(
      name: Routes.ForgotPasswordView,
      page: () =>    ForgotPasswordView(),
    ),
    // GetPage(
    //   name: Routes.catalog_2Page,
    //   page: () => Catalog_2Page(),
    // ),
  ];
}
