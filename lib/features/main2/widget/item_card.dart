import 'package:flutter/material.dart';
import '../model/main2.dart';

class ItemCard extends StatelessWidget {
  final ItemModel item;

  const ItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow:const [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    item.image,
                    height: 184,
                    width: 148,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 6,
                  left: 6,
                  height: 24,
                  width: 40,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "-${item.discount}%",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 6,
                  right: 6,
                  height: 24,
                  width: 24,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.favorite_border),
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 16),
              Icon(Icons.star, color: Colors.orange, size: 16),
              Icon(Icons.star, color: Colors.orange, size: 16),
              Icon(Icons.star, color: Colors.orange, size: 16),
              Icon(Icons.star, color: Colors.orange, size: 16),
              Text("(${item.reviews})"),
            ],
          ),
          Text(item.brand, style: TextStyle(color: Colors.grey)),
          Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            children: [
              Text("\$${item.oldPrice}", style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey)),
              const SizedBox(width: 5),
              Text("\$${item.newPrice}", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
