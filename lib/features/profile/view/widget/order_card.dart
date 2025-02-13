import 'package:flutter/material.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/core/utils/app_text_style.dart';

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
                    style: AppStyles.tajawaltextStyle16.copyWith(color: Colors.black),
                  ),
                  Text(
                    '05-12-2019',
                    style: AppStyles.tajawaltextStyle14.copyWith(
                      color: AppColors.grey1
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text.rich(
                    TextSpan(
                      text: 'Tracking number:',
                      style: AppStyles.tajawaltextStyle14.copyWith(
                        color: AppColors.grey1,
                      ),
                      children: [
                        TextSpan(
                          text: ' IW347543455',
                          style: AppStyles.tajawaltextStyle14.copyWith(
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
                      text: 'Quantity:',
                      style: AppStyles.tajawaltextStyle14.copyWith(
                        color: AppColors.grey1,
                      ),
                      children: [
                        TextSpan(
                          text: ' 4',
                          style: AppStyles.tajawaltextStyle14.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Total Amount:',
                      style: AppStyles.tajawaltextStyle14.copyWith(
                        color: AppColors.grey1,
                      ),
                      children: [
                        TextSpan(
                          text: ' 112\$',
                          style: AppStyles.tajawaltextStyle14.copyWith(
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
                    },
                    child:  Text('Details' ,style:AppStyles.tajawaltextStyle14.copyWith(
                      color: AppColors.black
                    ),),
                  ),
                  Text(
                    status,
                    style: TextStyle(
                      color: status == 'Delivered'
                          ? Colors.green
                          : status == 'Processing'
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
    );;
  }
}