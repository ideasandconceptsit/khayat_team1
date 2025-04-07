import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/profile/model/order_model.dart';
import 'package:team1_khayat/features/profile/view/widget/order_card.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key, required this.status, required this.orders});
  final String status;
  final List<OrderModels> orders;

  @override
  Widget build(BuildContext context) {
    List<OrderModels> filteredOrders = orders.where((order) {
      if (status == AppStrings.delivered.tr) {
        return order.status == 'completed';
      } else if (status == AppStrings.processing.tr) {
        return order.status == 'pending';
      } else if (status == AppStrings.cancelled.tr) {
        return order.status == 'cancelled';
      }
      return false;
    }).toList();

    if (filteredOrders.isEmpty) {
      return Center(
        child: Text(
          AppStrings.noOrder.tr,
        ),
      );
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: filteredOrders.length,
      itemBuilder: (context, index) {
        return OrderCard(
          status: status,
          order: filteredOrders[index],
        );
      },
    );
  }
}
