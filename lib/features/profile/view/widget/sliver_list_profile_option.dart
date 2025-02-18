import 'package:flutter/material.dart';
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
        title: 'My orders', subtitle: 'Already have 12 orders',
         onTap: () {
          NavigationService.to( Routes.myOrderView , arguments: null);

        }),
      ProfileOption(title: 'Shipping addresses', subtitle: '3 addresses'),
      ProfileOption(title: 'Payment methods', subtitle: 'Visa **34'),
      ProfileOption(title: 'Promocodes', subtitle: 'You have special promocodes'),
      ProfileOption(title: 'My reviews', subtitle: 'Reviews for 4 items'),
      ProfileOption(title: 'Settings', subtitle: 'Notifications, password'),
    ],
  );
  }
}