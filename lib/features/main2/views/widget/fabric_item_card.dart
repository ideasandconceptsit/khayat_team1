import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/favorite/controller/favorite_controller.dart';
import 'package:team1_khayat/features/main2/model/fabric_model.dart';

class FabricItemCard extends StatelessWidget {
  final FabricModel fabricItem;
  final favoriteController = Get.find<FavoriteController>();

  FabricItemCard({super.key, required this.fabricItem});

  @override
   Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 267.h,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/shert.png',
                    height: 252,
                    width: 157,
                    fit: BoxFit.cover,
                  ),
                ),
                if ((fabricItem.discount ?? 0) > 0)
                  Positioned(
                    left: 8.w,
                    top: 8.h,
                    child: Container(
                      width: 40.w,
                      height: 24.h,
                      decoration: BoxDecoration(
                        color: Color(0xFFDB3022),
                        borderRadius: BorderRadius.circular(29.r),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '-${fabricItem.discount}%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                     Positioned(
                  bottom: -5,
                  right: 2,
                  height: 36,
                  width: 36,
                  child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Obx(() {
                        bool isFav = favoriteController.favorites
                            .contains(fabricItem.id.toString());
                        return GestureDetector(
                          onTap: () {
                            favoriteController
                                .toggleFabricFavorite(fabricItem.id.toString());
                          },
                          child: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            size: 25,
                            color: isFav ? Colors.red : Colors.grey,
                          ),
                        );
                      })),
                ), 
                Positioned(
                  bottom: -5,
                  right: 2,
                  height: 36,
                  width: 36,
                  child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Obx(() {
                        bool isFav = favoriteController.favorites
                            .contains(fabricItem.id.toString());
                        return GestureDetector(
                          onTap: () {
                            favoriteController
                                .toggleFabricFavorite(fabricItem.id.toString());
                          },
                          child: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            size: 25,
                            color: isFav ? Colors.red : Colors.grey,
                          ),
                        );
                      })),
                ),
               // SizedBox(height: 7.h),
          
            
           
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              ...List.generate(
                  5,
                  (index) =>
                      const Icon(Icons.star, color: Colors.orange, size: 16)),
              Text(
                "(${fabricItem.ratingsAverage})",
                style: AppTextStyles.tajawaltextStyle11.copyWith(
                  fontSize: 10,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
          Text(
            fabricItem.category!.name??'',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            fabricItem.name??'',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4.h),
          Row(
            children: [
              if ((fabricItem.discount ?? 0) > 0) ...[
                Text(
                  '\$${fabricItem.pricePerMeter?.toStringAsFixed(2) ?? '0.00'}',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 1,
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(width: 4.w),
              ],
              Text(
                '\$${((fabricItem.pricePerMeter ?? 0) * (1 - (fabricItem.discount ?? 0) / 100)).toStringAsFixed(2)}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            '${fabricItem.quantity} ${fabricItem.unit?.tr ?? ''}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 12.sp,
            ),
          ),
          
        ],
      ),
    );
  }
}
