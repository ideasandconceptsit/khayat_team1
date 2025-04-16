import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class splashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/full.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(16),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 28.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                        text:
                            'اختر قماشك وزيّن ثوبك على كيفك، وبأحسن سعر من '),
                    TextSpan(
                      text: 'خياط',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
