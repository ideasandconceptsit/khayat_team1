import 'package:flutter/material.dart';
import 'package:team1_khayat/features/Favourite/bottombar.dart';
import 'package:team1_khayat/features/Favourite/favourite_home.dart';
import 'package:team1_khayat/features/Favourite/homeaddfavorites/productphoto.dart';
import 'package:team1_khayat/features/Favourite/homeaddfavorites/wedgit/adddata.dart';
import 'package:team1_khayat/features/Favourite/products.dart';
import 'package:team1_khayat/features/Favourite/productsale.dart';
import 'package:team1_khayat/features/Favourite/widget/cartpage.dart';
import 'package:team1_khayat/features/Favourite/widget/getdata.dart';
import 'package:team1_khayat/features/Favourite/widget/homepage.dart';
import 'package:team1_khayat/features/Favourite/widget/productdesgin.dart';
import 'package:team1_khayat/features/Favourite/widget/profilepage.dart';
import 'package:team1_khayat/features/Favourite/widget/shoppage.dart';


class Addfavorites extends StatefulWidget {
  static const String addFavorites = '/addFavorites';
  const Addfavorites({super.key});

  @override
  State<Addfavorites> createState() => _AddfavoritesState();
}

class _AddfavoritesState extends State<Addfavorites> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const Homepage(),
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
    return Scaffold(
      body:Homepage(),
      bottomNavigationBar: Bottombar(),
    );
  }
}








