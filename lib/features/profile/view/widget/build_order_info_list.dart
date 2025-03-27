import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/model/order_model.dart';
import 'package:team1_khayat/features/profile/view/widget/order_info.dart';

class BuildOderInfoList extends StatelessWidget {
  const BuildOderInfoList({super.key, this.order});
  final OrderModels? order;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: AppColors.grey),
        const SizedBox(height: 10),
        Text(
          AppStrings.orderInformation.tr,
          style: AppTextStyles.tajawaltextStyle14,
        ),
        const SizedBox(height: 10),
         OrderInfo(
            title: AppStrings.shippingAddresses.tr,
            value: '${order!.client!.address}',),
        OrderInfo(
            title: AppStrings.paymentMethods.tr,
            value: '${order!.paymentMethod} ',
            icon: Icons.credit_card),
         OrderInfo(
            title: AppStrings.delivreymethod.tr, value: 'FedEx, 3 days, 15\$'),
        OrderInfo(
          title: AppStrings.discount.tr,
          value: '${order!.discount}%  ',
        ),
        OrderInfo(
            title: AppStrings.totalAmount.tr,
            value: '${order!.totalPrice}\$',
            isBold: true),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: ButtonStyle(
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
                onPressed: () {},
                child:  Text(AppStrings.reorder.tr,
                    style: const TextStyle(color: AppColors.blackColor)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(AppColors.green),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
                child:  Text(AppStrings.home.tr,
                    style: const TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
