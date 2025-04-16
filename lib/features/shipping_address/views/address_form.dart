import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';
import 'package:team1_khayat/shared/custom_country_field/custom_country_field.dart';
import 'package:team1_khayat/shared/custom_input_field/custom_input_field.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';
import '../controllers/shipping_address_controller.dart';
import '../models/shipping_address_model.dart';

class AddressFormPage extends StatelessWidget {
  final ShippingAddressModel? addressToEdit;

  AddressFormPage({super.key, this.addressToEdit});

  final formKey = GlobalKey<FormState>();
  final ShippingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        arrowBackVisibility: true,
        arrowBackOnPressed: () {
          Get.back();
        },
        title: addressToEdit != null
            ? 'edit_address'.tr
            : 'adding_shipping_address'.tr,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomInputField(
                label: 'full_name'.tr,
                initialValue: addressToEdit?.name,
                onSaved: (value) => controller.tempAddress['name'] = value!,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'please_enter_full_name'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              CustomInputField(
                label: 'address'.tr,
                initialValue: addressToEdit?.addressLine1,
                onSaved: (value) =>
                    controller.tempAddress['addressLine1'] = value!,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'please_enter_address'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              CustomInputField(
                label: 'city'.tr,
                initialValue: addressToEdit?.city,
                onSaved: (value) => controller.tempAddress['city'] = value!,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'please_enter_city'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              CustomInputField(
                label: 'state_province_region'.tr,
                initialValue: addressToEdit?.state,
                onSaved: (value) => controller.tempAddress['state'] = value!,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'please_enter_state'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              CustomInputField(
                label: 'zip_code'.tr,
                initialValue: addressToEdit?.postalCode,
                onSaved: (value) =>
                    controller.tempAddress['postalCode'] = value!,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'please_enter_zip_code'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              CustomInputField(
                label: 'phone_number'.tr,
                initialValue: addressToEdit?.phone,
                onSaved: (value) => controller.tempAddress['phone'] = value!,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'please_enter_phone_number'.tr;
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.h),
              CustomCountryField(
                label: 'country'.tr,
                initialValue: addressToEdit?.country ??
                    'Saudi Arabia'.tr, // Changed to Saudi Arabia
                onTap: () {},
              ),
              SizedBox(height: 32.h),
              CustomAppButton(
                text: 'save_address'.tr,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (addressToEdit != null) {
                      controller.updateAddress(addressToEdit!.id);
                    } else {
                      controller.saveNewAddress();
                    }
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
