import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/features/main2/model/fabric_model.dart';
import 'item_card.dart';

class ItemFebricList extends StatelessWidget {
  const   ItemFebricList({super.key, required this.fabricList});
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
          return ItemCard(fabricItem: fabricList[index]);
        },
      ),
    );
  }
}