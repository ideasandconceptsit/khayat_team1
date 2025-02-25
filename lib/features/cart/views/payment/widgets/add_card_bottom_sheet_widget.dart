import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_assets.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/cart/controllers/checkout_controller.dart';
import 'package:team1_khayat/features/cart/models/payment_model.dart';
import 'package:team1_khayat/features/cart/views/payment/widgets/custom_add_card_text_form_filed.dart';
import 'package:team1_khayat/features/cart/views/payment/widgets/payment_checkbox.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';

class AddCardBottomSheetWidget extends StatelessWidget {
  const AddCardBottomSheetWidget({super.key});


  @override
  Widget build(BuildContext context) {
    final CheckoutController checkoutController =
    Get.find<CheckoutController>();
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        children: [
          Text(
            AppStrings.addNewCard.tr,
            style: AppTextStyles.textStyleBlack18,
          ),
          SizedBox(
            height: 18.h,
          ),
          CustomAddCardTextFormFiled(
            validator: (p0) => p0!.isEmpty ? AppStrings.required.tr : null,
            labelText: AppStrings.nameOnCard.tr,
            controller: checkoutController.nameOnCardController,

          ),
          SizedBox(
            height: 20.h,
          ),
          Obx(
            () {
              return CustomAddCardTextFormFiled(
                validator: (p0) => validateCardNumber(p0!)? null : AppStrings.pleaseEnterACorrectCardNumber.tr ,
              labelText: AppStrings.cardNumber.tr,
              controller: checkoutController.cardNumberController,
              suffixIcon: _buildSuffix(checkoutController.cardNumber.value),
            );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomAddCardTextFormFiled(

            labelText: AppStrings.expireDate.tr,
            formats: [
              FilteringTextInputFormatter.digitsOnly,
              ExpiryDateFormatter(),
            ],
            controller: checkoutController.expireDateController,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomAddCardTextFormFiled(
            labelText: AppStrings.cvv.tr,
            validator:(p0) => validateCVV(p0!)?null:AppStrings.pleaseEnterAValue.tr,
            controller: checkoutController.cVVDateController,
            formats: [
              FilteringTextInputFormatter.digitsOnly, // allow only digits
              LengthLimitingTextInputFormatter(4), // limit to 4 digits
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
               Obx(() =>  PaymentCheckbox(onTap: ()=> checkoutController.changeIsAddPaymentMethodSetDefaultEnabled(),isSelected: checkoutController.isAddPaymentMethodSetDefaultEnabled.value,)),
              SizedBox(
                width: 13.w,
              ),
              Text(
                AppStrings.useAsDefaultPayment.tr,
                style: AppTextStyles.textStyleRegular14
                    .copyWith(color: AppColors.blackColor),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomAppButton(
            onTap: (){
              if(formKey.currentState!.validate()) {
                checkoutController.addPaymentMethod();
              }
            },
            text: AppStrings.addCard.tr,
            height: 48.h,
          )
        ],
      ),
    );
  }

  Widget? _buildSuffix(String cardNumber) {
    if (cardNumber.isEmpty) return null;
    PaymentCardType cardType = PaymentModel.getCardType(
        cardNumber);
    if (cardType == PaymentCardType.Visa) {
      return Padding(
        padding:  EdgeInsetsDirectional.only(end: 20.0.w),
        child: Image.asset(AppAssets.visaLogo,height: 24.h,width: 24.w,fit: BoxFit.contain,),
      );
    } else {
      return Padding(
        padding:  EdgeInsetsDirectional.only(end: 20.0.w),
        child: Image.asset(AppAssets.masterCardLogo,height: 24.h,width: 24.w,fit: BoxFit.contain,),
      );
    }
  }
  bool validateCardNumber(String cardNumber) {
    cardNumber = cardNumber.replaceAll(RegExp(r'\s+'), ''); // إزالة الفراغات
    if (!RegExp(r'^\d{13,19}$').hasMatch(cardNumber)) return false;
    return luhnCheck(cardNumber);
  }
  bool validateCVV(String cvv) {
    return RegExp(r'^\d{3,4}$').hasMatch(cvv) && ( cvv.length == 4 || cvv.length == 3);
  }

  bool luhnCheck(String number) {
    int sum = 0;
    bool alternate = false;
    for (int i = number.length - 1; i >= 0; i--) {
      int digit = int.parse(number[i]);
      if (alternate) {
        digit *= 2;
        if (digit > 9) digit -= 9;
      }
      sum += digit;
      alternate = !alternate;
    }
    return (sum % 10 == 0);
  }
}

class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text =
        newValue.text.replaceAll(RegExp(r'[^0-9]'), ''); // السماح فقط بالأرقام

    if (text.length > 4) text = text.substring(0, 4); // الحد الأقصى 4 أرقام

    String formattedText = text;
    if (text.length >= 2) {
      formattedText = '${text.substring(0, 2)}/${text.substring(2)}';
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
