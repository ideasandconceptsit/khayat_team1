import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/shared/app_buttons/app_buttons.dart';
import 'package:team1_khayat/shared/custom_form_field/csutom_form_field.dart';

class PasswordChangeWidget extends StatelessWidget {
   PasswordChangeWidget({super.key, this.onTap});

 void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text('Password Change', style:  AppTextStyles.tajawaltextStyle18),
          SizedBox(height: 18.h), 
        SizedBox(height: 17.h), 
        CustomFormField( hintText: " New Password",),
        SizedBox(height: 24.h), 
        CustomFormField(hintText: "Repeat New Password",),
        SizedBox(height: 32.h), 
      DefaultButton(text: 'SAVE PASSWORD',
      ),
        SizedBox(height: 48.h), 
      
        ],
      ),
    );
  }
}