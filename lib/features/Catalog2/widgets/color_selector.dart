import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../catalog_controller/filter_controller.dart';

class ColorSelector extends StatelessWidget {
  final FilterController controller = Get.find();

  ColorSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'colors'.tr,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Obx(() => Row(
                children: controller.colors.map((color) {
                  final isSelected =
                      controller.selectedColors.contains(color['name']);
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: GestureDetector(
                      onTap: () => controller.toggleColor(color['name']),
                      child: Container(
                        width: 36.w,
                        height: 36.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(color['color']),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFFDB3022)
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: color['color'] == 0xFFFFFFFF
                            ? Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey),
                                ),
                              )
                            : null,
                      ),
                    ),
                  );
                }).toList(),
              )),
        ),
      ],
    );
  }
}
