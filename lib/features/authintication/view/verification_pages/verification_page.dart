import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/authintication/view/widgets/custom_text_field.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_style.dart';
import '../widgets/custom_button.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false),
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'verification'.tr,
              style: AppStyle.navBar,),
             SizedBox(height: 175.h,),
            CustomTextField(
                label: "otp".tr, controller: phoneController, isNumber: true),
             SizedBox(height: 44.h,),
             CustomButton(
              onPressed: (){
                //go to home screen check from api
              },
              text: "login".tr,
            ),
           // const Spacer(),
            //Center(child: buildHomeIndicator()),
          ],
        ),
      ),
    );
  }
}
