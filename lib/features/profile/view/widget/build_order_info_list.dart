import 'package:flutter/material.dart';
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
          AppStrings.orderInformation,
          style: AppTextStyles.tajawaltextStyle14,
        ),
        const SizedBox(height: 10),
        const OrderInfo(
            title: AppStrings.shippingAddresses,
            value: '3 Newbridge Court, Chino Hills, CA 91709, United States'),
        OrderInfo(
            title: AppStrings.paymentMethods,
            value: '${order!.paymentMethod} ',
            icon: Icons.credit_card),
        const OrderInfo(
            title: AppStrings.delivreymethod, value: 'FedEx, 3 days, 15\$'),
        OrderInfo(
          title: AppStrings.discount,
          value: '${order!.discount}% : Personal promo code',
        ),
        OrderInfo(
            title: AppStrings.totalAmount,
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
                child: const Text(AppStrings.reorder,
                    style: TextStyle(color: AppColors.blackColor)),
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
                child: const Text(AppStrings.home,
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
