import 'package:flutter/material.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/shared/navigation_service.dart';

import 'package:team1_khayat/state_managment/app_routers.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.status});
  final String status;

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
                  Text(
                    'Order №1947034',
                    style: AppTextStyles.tajawaltextStyle16.copyWith(color: Colors.black),
                  ),
                  Text(
                    '05-12-2019',
                    style: AppTextStyles.tajawaltextStyle14.copyWith(
                      color: AppColors.grey1
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text.rich(
                    TextSpan(
                      text:  AppStrings.trackingNumber,
                      style: AppTextStyles.tajawaltextStyle14.copyWith(
                        color: AppColors.grey1,
                      ),
                      children: [
                        TextSpan(
                          text: ' IW347543455',
                          style: AppTextStyles.tajawaltextStyle14.copyWith(
                            color: Colors.black,
                          ),
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
                      text:  AppStrings.quantity,
                      style: AppTextStyles.tajawaltextStyle14.copyWith(
                        color: AppColors.grey1,
                      ),
                      children: [
                        TextSpan(
                          text: ' 4',
                          style: AppTextStyles.tajawaltextStyle14.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text:  AppStrings.totalAmount,
                      style: AppTextStyles.tajawaltextStyle14.copyWith(
                        color: AppColors.grey1,
                      ),
                      children: [
                        TextSpan(
                          text: ' 112\$',
                          style: AppTextStyles.tajawaltextStyle14.copyWith(
                            color: Colors.black,
                          ),
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
                      NavigationService.to( Routes.detailsView , arguments: null);

                    },
                    child:  Text( AppStrings.details ,style:AppTextStyles.tajawaltextStyle14.copyWith(
                      color: AppColors.black
                    ),),
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