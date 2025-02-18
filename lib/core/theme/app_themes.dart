import 'package:flutter/material.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/core/app_constants.dart';

class AppThemes{
 static ThemeData lightTheme= ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
     primarySwatch: Colors.teal,


   // Set a unified default font and scaffoldBackgroundColor to avoid repetition.
   scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
   fontFamily: AppConstants.tajawalFontName,
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