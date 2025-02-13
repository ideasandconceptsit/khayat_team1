import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';
import 'package:team1_khayat/features/cart/views/widgets/cart_bottom_sheet_widget.dart';
import 'package:team1_khayat/shared/app_bottom_sheet/app_bottom_sheet.dart';

class PromoCodeSuffixIcon extends StatelessWidget {
  const PromoCodeSuffixIcon({super.key, required this.isBottomSheet});

  final bool isBottomSheet;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    return Obx(() {
      if (cartController.promoCodeText.isEmpty) {
        return Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              iconSize: 20.w,
              onPressed: () => _onPromoCodeIconPressed(context, isBottomSheet),
              icon: const Icon(Icons.arrow_forward,
                  color: Colors.white), // White icon
            ));
      }
      return IconButton(
          onPressed: () {
            cartController.clearPromoCode();
          },
          icon: const Icon(Icons.clear));
    });
  }

  void _onPromoCodeIconPressed(
    context,
    bool isBottomSheet,
  ) {
    if (isBottomSheet) {
      Get.back();
    } else {
      showCustomAppBottomSheet(context,
          height: 464.h,
          child: const CartBottomSheetWidget());
    }
  }
}



