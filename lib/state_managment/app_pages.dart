
import 'package:get/get.dart';
import 'package:team1_khayat/features/layout/view/buttom_nav_bar.dart';
import 'package:team1_khayat/features/profile/view/details_view.dart';
import 'package:team1_khayat/features/profile/view/my_order_view.dart';
import 'package:team1_khayat/features/profile/view/profile_view.dart';
import 'package:team1_khayat/state_managment/app_routers.dart';

class AppPages {

  static final pages = [
     GetPage(
      name: Routes.bottomNavBar,
      page: () =>  BottomNavBar(),
    ),
    GetPage(
      name: Routes.profileView,
      page: () => const ProfileView(),
    ),
      GetPage(
    name: Routes.myOrderView,
    page: () => const MyOrderView(),
    ),
    GetPage(
      name: Routes.detailsView,
      page: () =>  const DetailsView(),
    ),
];
}