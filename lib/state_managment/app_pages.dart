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
    GetPage(
      name: Routes.startPage,
      page: () => const StartPage(),
    ),
    // GetPage(
    //   name: Routes.catalog_2Page,
    //   page: () => Catalog_2Page(),
    // ),
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
               // "https://www.tessutidelarte.com/media/catalog/product/cache/e4d64343b1bc593f1c5348fe05efa4a6/_/d/_dsc7422.jpg",
              //  "https://www.fabricsgalore.co.uk/cdn/shop/products/PoshCottonCalico1.jpg?v=1588602485",
                //"https://m.media-amazon.com/images/I/61rDuVsVmRL._AC_SL1001_.jpg"

                "assets/images/Brown.jpeg",
                "assets/images/Gray.jpeg",
                "assets/images/Light_Brown.jpeg",
                "assets/images/Petroleum.jpeg","assets/images/Black.jpeg",
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