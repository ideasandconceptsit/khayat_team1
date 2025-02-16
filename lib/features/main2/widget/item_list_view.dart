import 'package:flutter/material.dart';
import '../model/main2.dart';
import 'item_card.dart';

class ItemList extends StatelessWidget {
  const ItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: demoItems.length,
        itemBuilder: (context, index) {
          return ItemCard(item: demoItems[index]);
        },
      ),
    );
  }
}
