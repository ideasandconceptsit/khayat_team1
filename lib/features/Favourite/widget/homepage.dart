import 'package:flutter/material.dart';
import 'package:team1_khayat/features/Favourite/homeaddfavorites/productphoto.dart';
import 'package:team1_khayat/features/Favourite/homeaddfavorites/wedgit/adddata.dart';
import 'package:team1_khayat/features/Favourite/productsale.dart';
import 'package:team1_khayat/features/Favourite/widget/productdesgin.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // العنوان مع زر "عرض الكل"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'New',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 34,
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // إضافة وظيفة لعرض جميع المنتجات
                      },
                      child: const Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                // النص التوضيحي
                Text(
                  'You’ve never seen it before!',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black.withOpacity(0.4),
                  ),
                ),
                const SizedBox(height: 10),

                // قائمة المنتجات
                SizedBox(
                  height: 320,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: list.length,
                    itemBuilder: (context, index) => Productphoto(
                      image: list[index].imageName,
                      starImage: list[index].starImage,
                      brandName: list[index].brandName,
                      productName: list[index].productName,
                      price: list[index].price,
                    ),
                    separatorBuilder: (context, index) =>
                    const SizedBox(width: 10),
                  ),
                ),

                const SizedBox(height: 20),

                // قسم "Sale"
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sale',
                          style: TextStyle(
                              fontSize: 34, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Super summer sale',
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        // إضافة وظيفة لعرض جميع المنتجات المخفضة
                      },
                      child: const Text(
                        'View all',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                SizedBox(
                  height: 400,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: Addfavourite.length,
                    itemBuilder: (context, index) => Productdesgin(
                      image: Addfavourite[index].image,
                      starImage: Addfavourite[index].starImage,
                      brand: Addfavourite[index].brand,
                      name: Addfavourite[index].name,
                      price: Addfavourite[index].price,
                      discount: Addfavourite[index].discount,
                    ),
                    separatorBuilder: (context, index) =>
                    const SizedBox(width: 10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// قائمة المنتجات الجديدة
List<Adddata> list = [
  Adddata(
    imageName: 'poloza',
    starImage: 'no points',
    brandName: 'OVS',
    productName: 'Blouse',
    price: 30,
  ),
  Adddata(
    imageName: 'shirt1',
    starImage: 'no points',
    brandName: 'Mango Boy',
    productName: 'T-Shirt Sailing',
    price: 10,
  ),
  Adddata(
    imageName: 'shirt1',
    starImage: 'no points',
    brandName: 'Cool',
    productName: 'Jeans',
    price: 45,
  ),
];

// قائمة المنتجات المخفضة
List<Productsale> Addfavourite = [
  Productsale(
    image: 'fustan',
    name: 'Evening Dress',
    brand: 'Dorothy Perkins',
    starImage: 'Rating 5 stars',
    price: 15,
    discount: 20,
  ),
  Productsale(
    image: 'sportDress',
    name: 'Sport Dress',
    brand: 'Sitlly',
    starImage: 'Rating 5 stars',
    price: 22,
    discount: 15,
  ),
  Productsale(
    image: 'sportdress2',
    name: 'Sport Dress',
    brand: 'Dorothy Perkins',
    starImage: 'Rating 5 stars',
    price: 14,
    discount: 20,
  ),
];
