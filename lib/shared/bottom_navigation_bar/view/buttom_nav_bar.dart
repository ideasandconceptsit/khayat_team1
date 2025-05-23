import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/Catalog2/choice_page.dart';
import 'package:team1_khayat/features/favorites/favorites_page.dart';
import 'package:team1_khayat/features/main2/views/main2_view.dart';
import '../../../features/Catalog2/catalog.dart';
import '../../../features/cart/views/cart/cart_view.dart';
import '../../../features/profile/view/profile_view.dart';
import '../controller/nav_bar_controller.dart';

class BottomNavBar extends StatelessWidget {
  final List<Widget> pages = [
    Main2(),
    // ChoiceScreen(),
    const CatalogPage(),
    CartView(),
    const FavoritesPage(),
    ProfileView(),
  ];

  final List<String> icons = [
    'assets/icons/Shape.svg',
    'assets/icons/shopping_cart.svg',
    'assets/icons/bag.svg',
    'assets/icons/favorite.svg',
    'assets/icons/account_circle.svg',
  ];

  final List<String> labels = [
    AppStrings.HomeIcon.tr,
    AppStrings.shopIcon.tr,
    AppStrings.cartIcon.tr,
    AppStrings.favoritesIcon.tr,
    AppStrings.profileIcon.tr,
  ];

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());

    return Obx(() => Scaffold(
      body: pages[controller.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: controller.changeIndex,
        backgroundColor: AppColors.background,
        selectedItemColor: AppColors.green,
        unselectedItemColor: AppColors.grey,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
          fontSize: 13.sp, // حجم خط العنصر المختار
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12.sp, // حجم خط العناصر غير المختارة
        ),
        items: List.generate(icons.length, (index) {
          return BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icons[index],
              colorFilter: ColorFilter.mode(
                controller.selectedIndex.value == index
                    ? AppColors.green
                    : AppColors.black,
                BlendMode.srcIn,
              ),
              width: 25.w,
              height: 25.h,
            ),
            label: labels[index],
          );
        }),
      ),
    ));
  }
}
