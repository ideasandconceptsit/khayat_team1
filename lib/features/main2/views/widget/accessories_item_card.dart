
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/main2/model/accessories_model.dart';
import 'package:team1_khayat/features/main2/model/fabric_model.dart';

class AccessoriesItemCard extends StatelessWidget {
 final ProductAccessories productAccessories;
  const AccessoriesItemCard({super.key, required this.productAccessories});

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
        boxShadow:const [
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
                    'assets/images/pants.png',
                    // item.image,
                    height: 252,
                    width: 157,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 7,
                  left: 6,
                  height: 24,
                  width: 40,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "${  productAccessories.discount}%",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.tajawaltextStyle11.copyWith(
                          color: Colors.white,
                          fontSize: 12,
                        ),
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
                    child: IconButton(
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
           SizedBox(height: 7.h),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 16),
              const Icon(Icons.star, color: Colors.orange, size: 16),
              const Icon(Icons.star, color: Colors.orange, size: 16),
              const Icon(Icons.star, color: Colors.orange, size: 16),
              const Icon(Icons.star, color: Colors.orange, size: 16),
              Text("(${productAccessories.ratingsAverage})", style: AppTextStyles.tajawaltextStyle11.copyWith(
                fontSize: 10,
                color: AppColors.grey
              ),),
            ],
          ),
          // Text(item.brand, style: AppTextStyles.tajawaltextStyle11),
          //            SizedBox(height: 3.h),

          Text(productAccessories.name, style: AppTextStyles.tajawaltextStyle16),
          Row(
            children: [
              // Text("\$${productAccessories.pricePerUnit}", style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey)),
               SizedBox(width: 5.w),
              Text("\$${productAccessories.pricePerUnit}", style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
