import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/Catalog2/catalog.dart';
import 'package:team1_khayat/features/appointment/views/appointment_view.dart';
import 'package:team1_khayat/features/authintication/view/signup_pages/signup_page.dart';
import 'package:team1_khayat/features/authintication/view/verification_pages/verification_page.dart';
import 'package:team1_khayat/features/cart/views/cart/cart_view.dart';
import 'package:team1_khayat/features/cart/views/checkout/checkout_view.dart';
import 'package:team1_khayat/features/cart/views/payment/payment_view.dart';
import 'package:team1_khayat/features/product/models/fabric_product_model.dart';
import 'package:team1_khayat/features/product/models/product_card_arguments.dart';
import 'package:team1_khayat/features/product/views/product_view.dart';
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
    GetPage(
      name: Routes.productCardPage,
      page: () => ProductCardView(),
    ),
    GetPage(
      name: Routes.startPage,
      page: () => const StartPage(),
    ),
  ];
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        Get.toNamed(Routes.productCardPage,arguments: ProductCardArgument(isFabric: true,fabricProductModel: FabricProductModel(
          id: "67bf94613024aff9082e7529",
          name: "قماش قطني فاخر",
          slug: "qmash-qtny-fakhr",
          category: Category(
            id: "67bf945b3024aff9082e7526",
            name: "قماش",
          ),
          quantity: 150,
          unit: "meter",
          pricePerMeter: 120.5,
          ratingsAverage: 2.9,
          ratingsQuantity: 13,
          discount: 10,
          minStock: 15,
          maxStock: 200,
          active: true,
          location: "main",
          createdAt: DateTime.parse("2025-02-26T22:23:29.907Z"),
          updatedAt: DateTime.parse("2025-04-03T12:22:14.716Z"),
          isLowStock: false,
          isOverStocked: false,
          profitMargin: 0,
          totalValue: 18075,
          totalCost: null,
        )));
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

