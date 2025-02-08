import 'package:flutter/material.dart';
import 'package:team1_khayat/core/app_colors.dart';

class AppThemes{
 static ThemeData lightTheme= ThemeData(
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
   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
   useMaterial3: true,
 );

}