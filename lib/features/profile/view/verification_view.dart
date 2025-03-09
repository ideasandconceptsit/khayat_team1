import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/view/widget/Build_password_change_widget.dart';
import 'package:team1_khayat/shared/app_bottom_sheet/app_bottom_sheet.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';
import 'package:team1_khayat/shared/custom_form_field/csutom_form_field.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: true),
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.verification.tr,
              style: AppTextStyles.tajawaltextStyle34),
             SizedBox(height: 175.h,),
             CustomFormField(
              hintText: 'OTP',
             ),
             SizedBox(height: 44.h,),
             CustomAppButton(
              height: 48.h,
              text: AppStrings.next.tr,
              onTap: () {
                showCustomAppBottomSheet(context ,
          height: MediaQuery.of(context).size.height *0.7,
          child:  PasswordChangeWidget());
              },
            ),
          
          ],
        ),
      ),
    );
  }
}

