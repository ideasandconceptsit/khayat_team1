import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/main2/model/accessories_model.dart';
import 'package:team1_khayat/features/main2/model/fabric_model.dart';
import 'package:team1_khayat/features/main2/views/widget/accessories_item_card.dart';
import 'package:team1_khayat/state_managment/app_pages.dart';
import 'fabric_item_card.dart';

class AccessoriesItemList extends StatelessWidget {
  const   AccessoriesItemList({super.key, required this.accessoriesList});
      final List<ProductAccessories> accessoriesList ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: accessoriesList.length,
        itemBuilder: (context, index) {
          return InkWell(
              onTap: (){
                Get.to(() => StartPage() );

              },
              child: AccessoriesItemCard( productAccessoriesItem: accessoriesList[index]));
        },
      ),
    );
  }
}