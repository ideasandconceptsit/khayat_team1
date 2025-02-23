import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/Favourite/bottombar.dart';
import 'package:team1_khayat/features/Favourite/categrs.dart';
import 'package:team1_khayat/features/Favourite/products.dart';
import 'package:team1_khayat/features/Favourite/widget/getdata.dart';

class FavouriteHome extends StatelessWidget {
  static const String favouritehome = '/favouritehome';

  const FavouriteHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Favorites',style: AppTextStyles.textStyleBlack18,),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black,size: 25.w,),
            onPressed: (){},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 55,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          print('Summer');
                        },
                        child: Categrs(textname: 'Summer'),
                      ),
                      InkWell(
                        onTap: () {
                          print('T-Shirts');
                        },
                        child: Categrs(textname: 'T-Shirts'),
                      ),
                      InkWell(
                        onTap: () {
                          print('Shirts');
                        },
                        child: Categrs(textname: 'Shirts'),
                      ),
                      InkWell(
                        onTap: () {
                          print('Bellover');
                        },
                        child: Categrs(textname: 'Bellover'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    print('Filters');
                  },
                  child: ImageIcon(AssetImage('assets/icons/filter_lis.png')),
                ),
                Text('Filters'),
                InkWell(
                  onTap: () {
                    print('Swap');
                  },
                  child: ImageIcon(AssetImage('assets/icons/swap.png')),
                ),
                Text('Price: lowest to high'),
                InkWell(
                  onTap: () {
                    print('View');
                  },
                  child: ImageIcon(AssetImage('assets/icons/View.png')),
                ),
              ],
            ),
            SizedBox(height: 7,),
            // هنا لا نحتاج SingleChildScrollView لأن GridView بالفعل Scrollable
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 19,
                  crossAxisSpacing: 17,
                  childAspectRatio: 0.44,
                ),
                itemCount: list.length,
                itemBuilder: (context, index) => Products(
                  image: list[index].image,
                  starImage: list[index].starImage,
                  brand: list[index].brand,
                  name: list[index].name,
                  color: list[index].color,
                  size: list[index].size,
                  price: list[index].price,
                  discount: list[index].discount ?? 0,
                  sold: list[index].sold,
                ),
              ),
            ),
          ],
        ),
      ),

    bottomNavigationBar: Bottombar(),
    );
  }
}
List<Getdata>list =[
  Getdata(
      image: 'jacket',
      starImage: 'Rating 5 stars',
      brand: 'Lime',
      name: 'Shirt',
      color: 'Blue',
      size: 'L',
      price: 100.00,
      discount: 20,
    sold: false,

    ),


  Getdata(
      image: 'Bollver',
      starImage: 'no points',
      brand: 'Mango',
      name: 'Longsleeve Violeta',
      color: 'Orange',
      size: 'S',
      price: 46,
    sold: false,
  ),
  Getdata(
    image: 'T-shirt',
    starImage: 'Rating 5 stars',
    brand: 'Olivier',
    name: 'Shirt',
    color: 'Gray',
    size: 'L',
    price: 52,
    sold: true,
  ),
  Getdata(
      image: 'jackt2',
      starImage: 'no points',
      brand: '&Berries',
      name: 'T-Shirt',
      color: 'Black',
      size: 'S',
      price: 39,
      discount: 30,
    sold: false,

  ),

];