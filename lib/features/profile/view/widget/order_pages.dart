import 'package:flutter/material.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'order_list.dart';

class OrderPages extends StatelessWidget {
  final int selectedIndex;
  const OrderPages({required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedIndex,
      children: [
         OrderList(status:  AppStrings.delivered),
         OrderList(status:  AppStrings.processing),
         OrderList(status:  AppStrings.cancelled),
      ],
    );
  }
}
