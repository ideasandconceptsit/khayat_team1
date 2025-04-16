import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_picker/country_picker.dart';

class CustomCountryField extends StatefulWidget {
  final String label;
  final String? initialValue;
  final Function(String)? onChanged;

  const CustomCountryField({
    Key? key,
    required this.label,
    this.initialValue,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomCountryFieldState createState() => _CustomCountryFieldState();
}

class _CustomCountryFieldState extends State<CustomCountryField> {
  String? selectedCountry;

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.initialValue ?? ''; // تعيين قيمة مبدئية فارغة
  }

  void _pickCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: false, // إخفاء كود الهاتف
      onSelect: (Country country) {
        setState(() {
          selectedCountry = country.name;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(country.name);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 4.h),
        GestureDetector(
          onTap: _pickCountry,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedCountry!.isNotEmpty ? selectedCountry! : "اختر الدولة",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: selectedCountry!.isNotEmpty ? Colors.black : Colors.grey,
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16.sp),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
