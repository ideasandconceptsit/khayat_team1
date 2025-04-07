import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/main2/views/widget/view_all_febric_view.dart';
import 'package:team1_khayat/shared/navigation_service.dart';

class FirstTitle extends StatelessWidget {
  const FirstTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
                  AppStrings.fabric.tr,
                  style:AppTextStyles.tajawaltextStyle34,
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () {
                  NavigationService.navigateTo(AllFabricView() ,
                  arguments: null
                  );
                },
                child:  Text(
                     AppStrings.viewAll.tr,
                    style:AppTextStyles.tajawaltextStyle11,
                ),
              ),
            ],
          ), 
          ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child:   Text(
                AppStrings.bookanAppointment.tr,
                style: AppTextStyles.tajawaltextStyle11.copyWith(
                  fontSize: 12,
                  color: Colors.white,
                ),
            ),
          ),
        ],
      ),
    );
  }
}