import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/controllers/checkout_controller.dart';
import 'package:team1_khayat/features/cart/models/delivry_method_model.dart';
import 'package:team1_khayat/features/cart/views/checkout/widgets/delivery_method_widget.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class DeliveryMethodSection extends StatelessWidget {
  const DeliveryMethodSection({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController checkoutController = Get.find<CheckoutController>();
    return
         Column(
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
                child: Obx(
                  () {
                    if(checkoutController.getDeliveryMethodsState.value == AppState.loading){return const DeliveryMethodsListSkeletonizer();}

                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          checkoutController.changeCurrentDeliveryMethod(index);
                        },
                        child: Obx(
                          () =>  DeliveryMethodWidget(
                            isSelected: checkoutController.currentDeliveryMethodIndex.value==index,
                                deliveryMethodModel:
                                    checkoutController.deliveryMethods[index],
                              ),
                        ),
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                            width: 22.w,
                          ),
                      itemCount: checkoutController.deliveryMethods.length);
                  },
                )),
        ],
      );
  }
}
class DeliveryMethodsListSkeletonizer extends StatelessWidget {
  const DeliveryMethodsListSkeletonizer({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
            onTap: null,
            child:   DeliveryMethodWidget(
                isSelected: false,
                deliveryMethodModel:_getDummyDeliveryMethodModel(),
              ),
          ),
          separatorBuilder: (context, index) => SizedBox(
            width: 22.w,
          ),
          itemCount: 5),
    );
  }
  DeliveryMethodModel _getDummyDeliveryMethodModel() => DeliveryMethodModel(
    estimatedDeliveryTime: EstimatedDeliveryTime(
      min: 2,
      max: 5,
      unit: 'days',
    ),
    weightLimits: WeightLimits(
      min: 1,
      max: 10,
    ),
    id: 'del_123',
    name: 'Express Shipping',
    description: 'Fast delivery within 2 to 5 days',
    price: 15.99,
    active: true,
    availableCountries: ['USA', 'Canada', 'UK'],
    carrier: 'DHL',
  );
}

