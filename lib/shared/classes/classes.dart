// import 'package:flutter/material.dart';
//
// class CartItemCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 343,
//       height: 104,
//
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(color: Colors.black12, blurRadius: 5),
//         ],
//       ),
//       child: Row(
//         children: [
//           // صورة المنتج
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Image.asset(
//               "assets/images/image.png", // ضع مسار الصورة هنا
//               width: 104,
//               height: 104,
//               fit: BoxFit.cover,
//             ),
//           ),
//           SizedBox(width: 16),
//
//           // تفاصيل المنتج
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Pullover",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   "Color: Black  Size: L",
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//
//           // زرار - والعدد و +
//           Column(
//             children: [
//               Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.remove),
//                   ),
//                   Text("1", style: TextStyle(fontSize: 18)),
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(Icons.add),
//                   ),
//                 ],
//               ),
//               Text("\$51", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const CartItemCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 104,

      child: Row(
        children: [
          Image.asset(item["image"], width: 104, height: 104, fit: BoxFit.cover),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item["name"], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Color: ${item["color"]}  Size: ${item["size"]}", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                  Text("1", style: TextStyle(fontSize: 18)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                ],
              ),
              Text("\$${item["price"]}", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}

