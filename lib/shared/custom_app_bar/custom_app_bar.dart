import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';


// Created this widget with reusability in mind to be used across multiple pages,
// including:
// - Categories,Filters,Brand,
// - Product Card,Rating & Reviews,
// - Favourites,
// - Checkout,Payment Method,Shipping Address,
// - My Profile,My Orders, Order Details, and Settings.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = "",
    this.actionIcon,
    this.actionIconOnPressed,
    this.arrowBackOnPressed,
    this.arrowBackVisibility,
    this.backgroundColor=AppColors.scaffoldBackgroundColor,
  });

  final String title;
  final IconData? actionIcon;
  final VoidCallback? actionIconOnPressed;
  final bool? arrowBackVisibility;
  final VoidCallback? arrowBackOnPressed;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 65.h,
      backgroundColor: backgroundColor,
      centerTitle: true,
      title: Text(
        title,
        style: AppTextStyles.textStyleBlack18,
      ),
      leading: arrowBackVisibility == true
          ? IconButton(
        icon:  Icon(Icons.arrow_back_ios, color: Colors.black,size: 22.w,),
        onPressed: arrowBackOnPressed ?? () => Get.back(),
      )
          : const SizedBox(),
      actions: [
        actionIcon == null
            ? const SizedBox()
            : IconButton(
          icon: Icon(actionIcon, color: Colors.black,size: 22.w,),
          onPressed: actionIconOnPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65.h);
}