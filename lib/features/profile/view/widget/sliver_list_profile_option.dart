import 'package:flutter/material.dart';
import 'package:team1_khayat/core/app_strings.dart';
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
        title: AppStrings.myOrders, subtitle: AppStrings.alreadyHaveOrders,
         onTap: () {
          NavigationService.to( Routes.myOrderView , arguments: null);

        }),
      ProfileOption(title: AppStrings.shippingAddresses, subtitle: AppStrings.numAddresses),
      ProfileOption(title: AppStrings.paymentMethods, subtitle: 'Visa **34'),
      ProfileOption(title: AppStrings.promoCodes, subtitle: AppStrings.youHaveSpecialPromoCodes),
      ProfileOption(title: AppStrings.myReviews, subtitle:AppStrings.reviewsForItems),
      ProfileOption(title: AppStrings.settings, subtitle:'${AppStrings.notifications}, ${AppStrings.password}' ,
       onTap: () {
          NavigationService.to( Routes.settingView , arguments: null);

        }
      ),
    ],
  );
  }
}