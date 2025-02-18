import 'package:flutter/material.dart';
import 'package:team1_khayat/features/profile/view/widget/order_card.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key, required this.status});
  final String status;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return OrderCard(status: status);
      },
    );
  }
}