import 'package:flutter/material.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/profile/model/order_model.dart';
import 'order_list.dart';

class OrderPages extends StatelessWidget {
  final int selectedIndex;
    final List<OrderModels> orders;

  const OrderPages({required this.selectedIndex, required this.orders});
  

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedIndex,
      children: [
         OrderList(status:  AppStrings.delivered,
         orders: orders,
         ),
         OrderList(status:  AppStrings.processing,
         orders: orders,
         ),
         OrderList(status:  AppStrings.cancelled,
         orders: orders,
         ),
      ],
    );
  }
}
