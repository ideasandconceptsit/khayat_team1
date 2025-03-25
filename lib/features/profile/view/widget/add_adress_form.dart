// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:team1_khayat/core/app_strings.dart';
// import 'package:team1_khayat/features/profile/controller/shipping-address_controller.dart';
// import 'package:team1_khayat/features/profile/model/address_model.dart';
// import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';
// import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';
// import 'package:team1_khayat/shared/custom_form_field/csutom_form_field.dart';

// class AddAddressForm extends StatelessWidget {
//   final AddressModel? addressToEdit;

//   AddAddressForm({super.key, this.addressToEdit});

//   final formKey = GlobalKey<FormState>();
//   final ShippingAddressController controller = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         arrowBackVisibility: true,
//         arrowBackOnPressed: () {
//           Get.back();
//         },
//         title: 'Add Address'.tr,
//       ),
//       body: Form(
//         key: formKey,
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(16.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomFormField(
//                 text: AppStrings.fullname.tr,
//                 labelText: AppStrings.fullname.tr,
//                 keyboardType: TextInputType.name,
//                 obscureText: false,
//                 // initialValue: addressToEdit?.name,
//                 validator: (value) {
//                   if (value?.isEmpty ?? true) {
//                     return AppStrings.pleaseenterYourEmail.tr;
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.h),
//               CustomFormField(
//                 text: 'address'.tr,
//                 labelText: 'address'.tr,
//                 keyboardType: TextInputType.text,
//                 obscureText: false,
//                 // initialValue: addressToEdit?.street,
//                 validator: (value) {
//                   if (value?.isEmpty ?? true) {
//                     return 'please_enter_address'.tr;
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.h),
//               CustomFormField(
//                 text: 'city'.tr,
//                 labelText: 'city'.tr,
//                 keyboardType: TextInputType.text,
//                 obscureText: false,
//                 // initialValue: addressToEdit?.city,
//                 validator: (value) {
//                   if (value?.isEmpty ?? true) {
//                     return 'please_enter_city'.tr;
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.h),
//               CustomFormField(
//                 text: 'state_province_region'.tr,
//                 labelText: 'state_province_region'.tr,
//                 keyboardType: TextInputType.text,
//                 obscureText: false,
//                 // initialValue: addressToEdit?.state,
//                 validator: (value) {
//                   if (value?.isEmpty ?? true) {
//                     return 'please_enter_state'.tr;
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.h),
//               CustomFormField(
//                 text: 'zip_code'.tr,
//                 labelText: 'zip_code'.tr,
//                 keyboardType: TextInputType.number,
//                 obscureText: false,
//                 // initialValue: addressToEdit?.zipCode,
//                 validator: (value) {
//                   if (value?.isEmpty ?? true) {
//                     return 'please_enter_zip_code'.tr;
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 32.h),
//               CustomAppButton(
//                 text: 'save_address'.tr,
//                 onTap: () {
//                   if (formKey.currentState!.validate()) {
//                     formKey.currentState!.save();
//                     if (addressToEdit != null) {
//                       // controller.updateAddress(addressToEdit!.id);
//                     } else {
//                       // controller.saveNewAddress();
//                     }
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
