import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/controllers/checkout_controller.dart';
import 'package:team1_khayat/features/cart/views/checkout/widgets/delivery_method_widget.dart';

class DeliveryMethodSection extends StatelessWidget {
  const DeliveryMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController checkoutController = Get.find<CheckoutController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.deliveryMethod.tr,
          style: AppTextStyles.textStyleBlack16,
        ),
        SizedBox(
          height: 19.h,
        ),
        SizedBox(
            height: 72.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    checkoutController.changeCurrentDeliveryMethod(index);
                  },
                  child: Obx(
                    () =>  DeliveryMethodWidget(
                      isSelected: checkoutController.currentDeliveryMethodIndex.value==index,
                          delivryMethodModel:
                              checkoutController.deliveryMethods[index],
                        ),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                      width: 22.w,
                    ),
                itemCount: checkoutController.deliveryMethods.length))
      ],
    );
  }
}
