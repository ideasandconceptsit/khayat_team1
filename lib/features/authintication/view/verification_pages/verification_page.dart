import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/authintication/view/widgets/custom_text_field.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_style.dart';
import '../widgets/custom_button.dart';
import '../widgets/ndicator_widget.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Verification'.tr,
              style: AppStyle.navBar,),
            const SizedBox(height: 150,),
            CustomTextField(
                label: "OTP", controller: phoneController, isNumber: true),
            const SizedBox(
              height: 40,
            ),
             CustomButton(
              onPressed: (){
                //go to home screen check from api
              },
              text: "LOGIN",
            ),
            const Spacer(),
            Center(child: buildHomeIndicator()),
          ],
        ),
      ),
    );
  }
}
