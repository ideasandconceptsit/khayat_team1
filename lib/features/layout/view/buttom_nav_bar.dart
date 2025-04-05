import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/features/layout/controller/nav_bar_controller.dart';
import 'package:team1_khayat/features/main2/views/main2_view.dart';
import 'package:team1_khayat/features/profile/view/profile_view.dart';

class BottomNavBar extends StatelessWidget {
  final List<Widget> pages = [
     Main2(),
    const ProfileView(),
    const ProfileView(),
    const ProfileView(),
    const ProfileView(),
  ];

  final List<String> icons = [
    'assets/icons/Shape.svg',
    'assets/icons/shopping_cart.svg',
    'assets/icons/bag.svg',
    'assets/icons/favorite.svg',
    'assets/icons/account_circle.svg',
  ];

  final List<String> labels = [
    'Home',
    'Shop',
    'Cart',
    'Favorites',
    'Profile',
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
            items: List.generate(icons.length, (index) {
              return BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  icons[index],
                  colorFilter: ColorFilter.mode(
                    controller.selectedIndex.value == index ? AppColors.green : AppColors.black,
                    BlendMode.srcIn,
                  ),
                  width: 24,
                  height: 24,  
                ),
                label: labels[index],
              );
            }),
          ),
        ));
  }
}
