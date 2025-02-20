import 'package:flutter/material.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/profile/view/widget/order_info.dart';

class BuildOderInfoList extends StatelessWidget {
  const BuildOderInfoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Divider(color: AppColors.grey),
                  const SizedBox(height: 10),
                  const Text(AppStrings.orderInformation, style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 10),
                  const OrderInfo(title: AppStrings.shippingAddresses, value: '3 Newbridge Court, Chino Hills, CA 91709, United States'),
                  const OrderInfo(title: AppStrings.paymentMethods, value: '**** **** **** 3947', icon: Icons.credit_card),
                  const OrderInfo(title: AppStrings.delivreymethod, value: 'FedEx, 3 days, 15\$'),
                  const OrderInfo(title: AppStrings.discount, value: '10%, Personal promo code'),
                  const OrderInfo(title: AppStrings.totalAmount, value: '133\$', isBold: true),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text(AppStrings.reorder, style: TextStyle(color: Colors.black)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                          child: const Text(AppStrings.home, style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
      ],
    );
  }
}