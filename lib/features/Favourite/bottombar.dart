import 'package:flutter/material.dart';
import 'package:team1_khayat/features/Favourite/homeaddfavorites/addfavorites.dart';
import 'package:team1_khayat/features/Favourite/widget/cartpage.dart';
import 'package:team1_khayat/features/Favourite/widget/homepage.dart';
import 'package:team1_khayat/features/Favourite/widget/profilepage.dart';
import 'package:team1_khayat/features/Favourite/widget/shoppage.dart';

import 'favourite_home.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Addfavorites(),
    const Shoppage(),
    const Cartpage(),
    const FavouriteHome(),
    const Profilepage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;

    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex, // تحديد الأيقونة النشطة
      onTap: _onItemTapped, // استدعاء الدالة عند الضغط على عنصر
      selectedItemColor: Colors.green, // اللون للأيقونة النشطة
      unselectedItemColor: Colors.grey, // اللون للأيقونة غير النشطة
      backgroundColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,size: 30),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart,size: 30,),
          label: 'Shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag_rounded,size: 30),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite,size: 30),
          label: 'Favourites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,size: 30),
          label: 'Profile',
        ),
      ],
    );
  }
}
