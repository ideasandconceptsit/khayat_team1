import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/profile/view/promo_code_view.dart';
import 'package:team1_khayat/features/profile/view/widget/profile_option.dart';
import 'package:team1_khayat/shared/navigation_service.dart';
import 'package:team1_khayat/state_managment/app_routers.dart';

class SliverListProfileOption extends StatelessWidget {
  const SliverListProfileOption({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(), 
    children: [
      ProfileOption(
        title: AppStrings.myOrders.tr, subtitle: AppStrings.alreadyHaveOrders.tr,
         onTap: () {
          NavigationService.navigateToNamed( Routes.myOrderView , arguments: null);

        }),
      ProfileOption(title: AppStrings.shippingAddresses.tr, subtitle: AppStrings.numAddresses.tr,
      onTap: () {
        NavigationService.navigateToNamed( Routes.shippingAddressPage , arguments: null);

      },),
      ProfileOption(title: AppStrings.paymentMethods.tr, subtitle: 'Visa **34'),
      ProfileOption(title: AppStrings.promoCodes.tr, subtitle: AppStrings.youHaveSpecialPromoCodes.tr,
      onTap: () {
       Get.to(() =>  PromoCodeView());

      },),
      ProfileOption(title: AppStrings.myReviews.tr, subtitle:AppStrings.reviewsForItems.tr,
      onTap: () {
       NavigationService.navigateToNamed( Routes.reviewAndRatingScreen);

      },
      ),
      ProfileOption(title: AppStrings.settings.tr, subtitle:'${AppStrings.notifications.tr} _ ${AppStrings.password.tr}' ,
       onTap: () {
          NavigationService.navigateToNamed( Routes.settingView , arguments: null);

        }
      ),
    ],
  );
  }
}