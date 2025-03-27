import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/model/address_model.dart';
import 'package:team1_khayat/features/profile/view/widget/edit_address_form.dart';

class AddressCard extends StatelessWidget {
  final AddressModel address;
  final bool isSelected;
  final Function(String) onSelect;
  // final Function(String) onEdit;

  const AddressCard({
    Key? key,
    required this.address,
    required this.isSelected,
    required this.onSelect,
    // required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                address.name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => EditAddressForm(addressToEdit: address));
                },
                // => onEdit(address.id),
                child: Text(
                  'edit'.tr,
                  style: TextStyle(
                    fontFamily: 'Tajawal',
                    color: Colors.red,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 6.h),

          Text(
            address.addressLine1,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            '${address.city}, ${address.state} ${address.postalCode}, ${address.country}',
            style: AppTextStyles.textStyleMedium14,
          ),
          SizedBox(height: 12.h),

          InkWell(
            onTap: () => onSelect(address.id),
            child: Row(
              children: [
                Checkbox(
                  value: isSelected,
                  onChanged: (_) => onSelect(address.id),
                  activeColor: Colors.black,
                ),
                SizedBox(width: 8.w),
                Text( 
                  'use_as_shipping_address'.tr,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
