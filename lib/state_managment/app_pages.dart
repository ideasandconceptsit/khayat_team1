import 'package:get/get.dart';

import 'package:team1_khayat/features/Favourite/favourite_home.dart';
import 'package:team1_khayat/features/Favourite/homeaddfavorites/addfavorites.dart';

import 'package:team1_khayat/state_managment/app_routers.dart';


class AppPages {
  static final pages = [
    GetPage(
      name: Routes.favouritehome,
      page: () => FavouriteHome(),
    ),
    GetPage(
      name: Routes.addFavorites,
      page: () => Addfavorites(),
    ),
  ];
}
