import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/cart/controllers/payment_controller.dart';
import 'package:team1_khayat/features/cart/views/payment/widgets/add_card_bottom_sheet_widget.dart';
import 'package:team1_khayat/features/profile/view/widget/profile_option.dart';
import 'package:team1_khayat/shared/app_bottom_sheet/app_bottom_sheet.dart';
import 'package:team1_khayat/state_managment/app_routers.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class PaymentMethodsBuilder extends StatelessWidget {
  PaymentMethodsBuilder({
    super.key,
  });

  final PaymentController paymentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var getPaymentCardsState =
          paymentController.getPaymentCardsState.value;
      return ProfileOption(
          onTap: () => _onTap(getPaymentCardsState, context),
          title: AppStrings.paymentMethods.tr,
          subtitle: _getSubtitle(getPaymentCardsState));
    });
  }

  String _getSubtitle(AppState getPaymentCardsState) {
    final PaymentController paymentController = Get.find();

    if( getPaymentCardsState==AppState.loading)
      {
        return AppStrings.loading.tr;
      }
    else if(getPaymentCardsState ==AppState.error)
      {
        return AppStrings.someThingWentWrong.tr;
      }
    else if(paymentController.paymentCardsList.isEmpty)
      {
        return AppStrings.noPaymentMethodAdded.tr;
      }
    return paymentController.hiddenCardNumber.value;
  }

  void _onTap(AppState getPaymentCardsState, BuildContext context) {
    final PaymentController paymentController = Get.find();

    if(getPaymentCardsState==AppState.loading||getPaymentCardsState==AppState.error) {
      return;
    }
    else if(paymentController.paymentCardsList.isEmpty)
    {
      showCustomAppBottomSheet(context,
          height: 572.h, child: AddCardBottomSheetWidget());
    }else{
      Get.toNamed(Routes.paymentPage);
    }
  }
}