import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderInfo extends StatelessWidget {
  final IconData? icon;
  final String title;
  final String value;
  final bool isBold;

  const OrderInfo({
    super.key,
    this.icon,
    required this.title,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
          if (icon != null) Icon(icon, color: Colors.white, size: 18),
          if (icon != null) SizedBox(width: 8.w),
          Expanded(
            flex: 2, 
            child: Text(
              title,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            flex: 3, 
            child: Text(
              value,
              maxLines: null, 
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: Colors.white,
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
