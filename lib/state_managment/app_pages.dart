import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/features/Catalog2/catalog.dart';
import 'package:team1_khayat/features/appointment/views/appointment_view.dart';
import 'package:team1_khayat/features/authintication/view/signup_pages/signup_page.dart';
import 'package:team1_khayat/features/authintication/view/verification_pages/verification_page.dart';
import 'package:team1_khayat/features/cart/views/cart/cart_view.dart';
import 'package:team1_khayat/features/cart/views/checkout/checkout_view.dart';
import 'package:team1_khayat/features/cart/views/payment/payment_view.dart';
import 'package:team1_khayat/features/product/views/product_view.dart';
import 'package:team1_khayat/state_managment/app_routers.dart';

import '../features/authintication/view/login_pages/login_page.dart';
import '../features/homepage/view/homepage.dart';
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
        Get.toNamed(Routes.productCardPage,
            arguments: FabricProductModel(
              id: "67bf94613024aff9082e7529",
              price: 150.0,
              name: "Cotton Fabric",
              unit: "meter",
              location: "Warehouse A",
              quantity: 120,
              discount: 10.0,
              minStock: 20,
              maxStock: 300,
              active: true,
              createdAt: DateTime.now().subtract(const Duration(days: 10)),
              updatedAt: DateTime.now(),
              ratingsAverage: 4.2,
              ratingsQuantity: 32,
              slug: "cotton-fabric",
              isLowStock: false,
              isOverStocked: false,
              profitMargin: 25.0,
              totalCost: 100.0,
              totalValue: 18000.0,
              category: Category(
                id: "cat01",
                name: "Fabrics",
              ),
              images: [
                "https://www.tessutidelarte.com/media/catalog/product/cache/e4d64343b1bc593f1c5348fe05efa4a6/_/d/_dsc7422.jpg",
                "https://www.fabricsgalore.co.uk/cdn/shop/products/PoshCottonCalico1.jpg?v=1588602485",
                "https://m.media-amazon.com/images/I/61rDuVsVmRL._AC_SL1001_.jpg"
              ],
              pricePerMeter: 15.0,
            ));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(color: AppColors.scaffoldBackgroundColor,);
  }
}
