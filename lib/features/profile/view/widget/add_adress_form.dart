import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/profile/controller/shipping-address_controller.dart';
import 'package:team1_khayat/shared/cuntry_field/custom_country_field.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';
import 'package:team1_khayat/shared/custom_form_field/csutom_form_field.dart';

class AddAddressForm extends StatelessWidget {
  AddAddressForm({super.key});

  final formKey = GlobalKey<FormState>();
  final ShippingAddressController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        arrowBackVisibility: true,
        arrowBackOnPressed: () => Get.back(),
        title: 'Add Address'.tr,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFormField(
                controller: controller.fullNameController,
                text: AppStrings.fullname.tr,
                labelText: AppStrings.fullname.tr,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'please_enter_fullname'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              CustomFormField(
                controller: controller.addressController,
                text: 'address'.tr,
                labelText: 'address'.tr,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'please_enter_address'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              CustomFormField(
                controller: controller.cityController,
                text: 'city'.tr,
                labelText: 'city'.tr,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'please_enter_city'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              CustomFormField(
                controller: controller.stateController,
                text: 'state'.tr,
                labelText: 'state'.tr,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'please_enter_state'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              
              CustomFormField(
                controller: controller.zipCodeController,
                text: 'Postal Code'.tr,
                labelText: 'Postal Code'.tr,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'please_enter_postal_code'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              CustomFormField(
                controller: controller.phoneController,
                text: 'phone'.tr,
                labelText: 'phone'.tr,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'please_enter_phone'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
             
              CustomFormField(
                controller: controller.addressTypeController,
                text: 'address_type'.tr,
                labelText: 'address_type'.tr,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'please_enter_address_type'.tr;
                  }
                  return null;
                },
              ),
                            SizedBox(height: 16.h),

               CustomCountryField(
                label: 'country'.tr,
                initialValue: 'Saudi Arabia',
                onChanged: (value) => controller.countryController.text = value,
              ),
              SizedBox(height: 32.h),
              CustomAppButton(
                text: 'save_address'.tr,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    controller.addNewAddress();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}