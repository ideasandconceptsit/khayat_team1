import 'package:flutter/material.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/model/order_model.dart';


class BuildItemListOrderDetails extends StatelessWidget {
  const BuildItemListOrderDetails({super.key, this.order});
 final OrderModels? order; 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage('assets/images/image@2x.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Todo " problem index"//////
                Text(
                  order!.items[0].item.name,
                  style: AppTextStyles.tajawaltextStyle16,
                ),
                const SizedBox(height: 1),
                Text(
                  order!.items[0].item.category.name,
                  style: AppTextStyles.tajawaltextStyle11.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  'Color: Gray    Size: L',
                  style: AppTextStyles.tajawaltextStyle11.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                const SizedBox(height: 11),
                Text(
                  'Units: ${ order!.items[0].quantity}',
                  style: AppTextStyles.tajawaltextStyle11.copyWith(
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 60), // To push the text to the bottom
              Text(
                '${order!.items[0].totalPrice}\$',
               
                style: AppTextStyles.tajawaltextStyle14.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
