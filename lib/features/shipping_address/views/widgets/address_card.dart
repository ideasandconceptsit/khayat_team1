import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/shipping_address/models/shipping_address_model.dart';

class AddressCard extends StatelessWidget {
  final ShippingAddressModel address;
  final bool isSelected;
  final Function(String) onSelect;
  final Function(String) onEdit;

  const AddressCard({
    Key? key,
    required this.address,
    required this.isSelected,
    required this.onSelect,
    required this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
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
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                onPressed: () => onEdit(address.id),
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
          SizedBox(height: 4.h),
          Text(
            address.street,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
              '${address.city}, ${address.state} ${address.zipCode}, ${address.country}',
              style: AppTextStyles.textStyleMedium14),
          SizedBox(height: 12.h),
          InkWell(
            onTap: () => onSelect(address.id),
            child: Row(
              children: [
                SizedBox(
                  width: 24.w,
                  height: 24.w,
                  child: Checkbox(
                    value: isSelected,
                    onChanged: (_) => onSelect(address.id),
                    activeColor: Colors.black,
                  ),
                ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),
                    Text(
                      'use_as_shipping_address'.tr,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
