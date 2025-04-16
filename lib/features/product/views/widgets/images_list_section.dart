import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/product/controllers/product_controller.dart';
import 'package:team1_khayat/shared/custom_cached_network_image/custom_cached_network_image.dart';

class ImagesListSection extends StatelessWidget {
  const ImagesListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductCardController>();

    return Obx(() {
      final images = controller.selectedImages;

      return images.isNotEmpty
          ? SizedBox(
        height: 413.h,
        width: double.infinity,
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: images
              .map(
                (e) => CustomCachedNetworkImage(
                imageUrl: e,
                height: 413.h,
                width: double.infinity),
          )
              .toList(),
        ),
      )
          : Container(
        height: 413.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline),
            Text("No Images"),
          ],
        ),
      );
    });
  }
}
