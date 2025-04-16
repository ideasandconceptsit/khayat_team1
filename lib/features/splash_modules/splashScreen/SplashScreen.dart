import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class splashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: AppBar(
            centerTitle: true,
            title: Text(
              //'SOUG SAHM',
              "خياط",
              style: TextStyle(
                fontSize: 18.0.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFA7E7BF),
        width: double.infinity,
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/images/log.png'),
              height: 360.0.h,
              width: 310.0.w,
            ),

            Image(
              image: AssetImage('assets/images/beautiful-young.png'),
              height: 364.0.h,
              width: 270.0.w,
            ),
          ],
        ),
      ),
    );
  }
}
