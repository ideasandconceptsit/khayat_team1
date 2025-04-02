import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../catalog_controller/filter_controller.dart';

class PriceRangeSlider extends StatelessWidget {
  final FilterController controller = Get.find();

  PriceRangeSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'price range'.tr,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Obx(() => Column(
              children: [
                RangeSlider(
                  values: RangeValues(
                    controller.minPrice.value,
                    controller.maxPrice.value,
                  ),
                  min: 0,
                  max: 300,
                  activeColor: const Color(0xFFDB3022),
                  inactiveColor: Colors.grey[300],
                  onChanged: (RangeValues values) {
                    controller.updatePriceRange(values);
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$${controller.minPrice.value.toInt()}'),
                      Text('\$${controller.maxPrice.value.toInt()}'),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
