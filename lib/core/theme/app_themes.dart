import 'package:flutter/material.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';

class AppThemes{
 static ThemeData lightTheme= ThemeData(
  fontFamily: 'Tajawal',
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
     primarySwatch: Colors.teal,
     scaffoldBackgroundColor: AppColors.background,
     appBarTheme: AppBarTheme(
       backgroundColor: AppColors.primary,
   //    titleTextStyle: AppText.appBarTitle,
     ),
  );

 static ThemeData darkTheme= ThemeData(
  fontFamily: 'Tajawal',
   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
   useMaterial3: true,
 );

}