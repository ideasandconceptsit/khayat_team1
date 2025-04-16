import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/cart/views/payment/widgets/add_card_bottom_sheet_widget.dart';
import 'package:team1_khayat/shared/app_bottom_sheet/app_bottom_sheet.dart';

class PaymentViewFAB extends StatelessWidget {
  const PaymentViewFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          showCustomAppBottomSheet(context,
              height: 572.h, child: const AddCardBottomSheetWidget());
        },
        backgroundColor: AppColors.blackColor,
        mini: true,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: AppColors.whiteColor,
        )
    );
  }
}