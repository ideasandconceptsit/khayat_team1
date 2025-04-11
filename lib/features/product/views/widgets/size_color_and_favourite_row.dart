import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/Catalog2/catalog_controller/product_controller.dart';
import 'package:team1_khayat/features/product/controllers/product_controller.dart';
import 'package:team1_khayat/features/product/models/base_product_model.dart';
import 'package:team1_khayat/features/product/views/widgets/color_drop_menu.dart';
import 'package:team1_khayat/features/product/views/widgets/product_card_body.dart';
import 'package:team1_khayat/shared/custom_mini_circle_button/custom_mini_circle_button.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class SizeColorAndFavouriteRow extends StatelessWidget {
  const SizeColorAndFavouriteRow({super.key});


  @override
  Widget build(BuildContext context) {
    ProductCardController productCardController = Get.find();
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 12.h),
      child: Row(
        children: [
          const Expanded(child: CustomDropMenu(title: "Medium", values: ['Medium','Large','Small'],)),
          SizedBox(width: 16.w,),
          const Expanded(child: CustomDropMenu(title: "Black", values: ['Black','Red','Blue'],)),
          SizedBox(width: 16.w,),
           Obx(
             ()=> CustomMiniCircleButton(isLoading: productCardController.addToFavoritesState.value == AppState.loading,icon: Icons.favorite_border,onTap: (){
               productCardController.addToFavorites();

             },),
           )

        ],
      ),
    );
  }
}