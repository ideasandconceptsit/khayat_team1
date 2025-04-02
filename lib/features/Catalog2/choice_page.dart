// screens/choice_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'catalog.dart';
import 'models/product_model.dart';

class ChoiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('choose_product_type'.tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  Get.to(() => CatalogPage(), arguments: ProductType.fabric),
              child: Text('fabrics'.tr),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200.w, 50.h),
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () =>
                  Get.to(() => CatalogPage(), arguments: ProductType.accessory),
              child: Text('accessories'.tr),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200.w, 50.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
