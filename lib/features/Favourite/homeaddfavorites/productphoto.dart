import 'package:flutter/material.dart';

class Productphoto extends StatefulWidget {
  final String image;
  final String starImage;
  final String brandName;
  final String productName;
  final  double price;

  Productphoto({
    required this.image,
    required this.starImage,
    required this.brandName,
    required this.productName,
    required this.price,
  });

  @override
  State<Productphoto> createState() => _ProductphotoState();
}

class _ProductphotoState extends State<Productphoto> {
  bool isFavorites = false;

  void selected() {
    setState(() {
      isFavorites = !isFavorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 205,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  onTap: () {
                    // استدعاء الدالة هنا بعد تعريفها
                    showModelBottomSheet(context);
                  },
                  child: Image.asset('assets/images/${widget.image}.png'),
                ),
              ),
              Positioned(
                left: 5,
                top: 10,
                child: Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    'NEW',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                right: 0,
                child: GestureDetector(
                  onTap: selected,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                    decoration: BoxDecoration(
                      color: isFavorites ? Colors.red : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: isFavorites
                        ? Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 20,
                    )
                        : ImageIcon(
                      AssetImage('assets/images/favorite_border.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Image.asset('assets/images/${widget.starImage}.png'),
        SizedBox(
          height: 7,
        ),
        Text(
          widget.brandName,
          style: TextStyle(fontSize: 11, color: Colors.grey),
        ),
        Text(
          widget.productName,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          '\$${widget.price.toStringAsFixed(2)}',
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }

  void showModelBottomSheet(BuildContext context) {
    String selectedSize = ''; // لتحديد الزر الذي تم اختياره

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // العنوان
                  Text(
                    'Select size',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),

                  // الأزرار بشكل منظم
                  Wrap(
                    spacing: 10, // المسافة بين الأزرار
                    runSpacing: 10, // المسافة بين الصفوف
                    children: ['XS', 'S', 'M', 'L', 'XL'].map((size) {
                      return OutlinedButton(
                        onPressed: () {
                          setState(() {
                            selectedSize = size;
                          });
                          print('$size size selected');
                        },
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                              horizontal: 36, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          side: BorderSide(
                            color: selectedSize == size ? Colors.green : Colors
                                .grey.shade300,
                          ),
                          backgroundColor: selectedSize == size ? Colors.green
                              .shade300 : Colors.white,
                        ),
                        child: Text(
                          size,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Divider(),
                  ListTile(
                    title: Text('Size info'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      print('Open size info');
                    },
                  ),
                  Divider(endIndent: 0,indent: 0,),

                  SizedBox(height: 16),

                  // زر "إضافة إلى المفضلة"
                  ElevatedButton(
                    onPressed: () {
                      if (selectedSize.isNotEmpty) {
                        print("Added to favorites: $selectedSize");
                        Navigator.pop(context); // إغلاق الـ BottomSheet
                      } else {
                        print("Please select a size first!");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(
                          vertical: 14, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "ADD TO FAVORITES",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),

                ],
              ),
            );
          },
        );
      },
    );
  }
}