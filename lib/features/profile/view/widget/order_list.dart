import 'package:flutter/material.dart';
import 'package:team1_khayat/features/profile/model/order_model.dart';
import 'package:team1_khayat/features/profile/view/widget/order_card.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key, required this.status, required this.orders});
  final String status;
  final List<OrderModels> orders;

  @override
  Widget build(BuildContext context) {
    return  
    
    ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderCard(status: status, order: orders[index],
        
        );
      },
    );
  }
}