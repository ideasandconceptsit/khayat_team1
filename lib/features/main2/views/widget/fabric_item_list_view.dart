import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/main2/model/fabric_model.dart';
import 'package:team1_khayat/features/product/models/base_product_model.dart';
import 'package:team1_khayat/state_managment/app_pages.dart';
import 'package:team1_khayat/state_managment/app_routers.dart';
import 'fabric_item_card.dart';

class FebricItemList extends StatelessWidget {
  const   FebricItemList({super.key, required this.fabricList});
      final List<FabricModel> fabricList ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: fabricList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              ///todo
              Get.toNamed(Routes.productCardPage,
                  arguments: FabricProductModel.fromJson(fabricList[index].toJson()));

            },
            child: FabricItemCard(fabricItem: fabricList[index] ,

            ),
          );
        },
      ),
    );
  }
}