import 'package:flutter/material.dart';
import 'order_list.dart';

class OrderPages extends StatelessWidget {
  final int selectedIndex;
  const OrderPages({required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedIndex,
      children: [
        const OrderList(status: 'Delivered'),
        const OrderList(status: 'Processing'),
        const OrderList(status: 'Cancelled'),
      ],
    );
  }
}
