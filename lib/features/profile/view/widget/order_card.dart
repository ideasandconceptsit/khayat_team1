import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/model/order_model.dart';
import 'package:team1_khayat/features/profile/view/details_view.dart';


class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.status, required this.order});
  final String status;
    final OrderModels order;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      child: Text(
        
        '${AppStrings.order.tr} №${order.orderNumber}',
        style: AppTextStyles.tajawaltextStyle16.copyWith(color: Colors.black),
        overflow: TextOverflow.ellipsis, 
      ),
    ),
   Text(
  order.createdAt.split('T')[0], 
  style: AppTextStyles.tajawaltextStyle14.copyWith(color: AppColors.grey1),
),

  ],
),

              const SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  text: AppStrings.trackingNumber.tr,
                  style: AppTextStyles.tajawaltextStyle14.copyWith(color: AppColors.grey1),
                  children: [
                    TextSpan(
                      text: order.client.phone,
                      style: AppTextStyles.tajawaltextStyle14.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text:  AppStrings.quantity.tr,
                      style: AppTextStyles.tajawaltextStyle14.copyWith(color: AppColors.grey1),
                      children: [
                        TextSpan(
                          text: order.totalQuantity.toString(),
                          style: AppTextStyles.tajawaltextStyle14.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text:  AppStrings.totalAmount.tr,
                      style: AppTextStyles.tajawaltextStyle14.copyWith(color: AppColors.grey1),
                      children: [
                        TextSpan(
                          text:  order.totalPrice.toString() +'\$',
                          style: AppTextStyles.tajawaltextStyle14.copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Get.to(() => DetailsView(order: order ,
                     
                      ));
                    },
                    child: Text(
                      AppStrings.details.tr,
                      style: AppTextStyles.tajawaltextStyle14.copyWith(color: AppColors.black),
                    ),
                  ),
                  Text(
                    status,
                    style: TextStyle(
                      color: status ==  AppStrings.delivered
                          ? Colors.green
                          : status ==  AppStrings.processing
                              ? Colors.orange
                              : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}