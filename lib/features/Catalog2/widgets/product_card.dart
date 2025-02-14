import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../models/product.dart';
import '../catalog_controller/product_controller.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({super.key, required this.product});

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none, // مهم جدًا عشان يظهر جزء اللايك تحت الصورة
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                product.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150.h, // تعديل الارتفاع لو لزم الأمر
              ),
            ),
            if (product.discount != null)
              Positioned(
                left: 8.w,
                top: 8.h,
                child: Container(
                  width: 40.w,
                  height: 24.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFDB3022),
                    borderRadius: BorderRadius.circular(29.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '-${product.discount}%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            Positioned(
              right: 8.w,
              top: 110.h,
              child: Obx(() => Transform.translate(
                    offset: Offset(0, 10.h),
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: GestureDetector(
                        onTap: () => productController.toggleLike(product.id),
                        child: Icon(
                          productController.isLiked(product.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 24.sp,
                          color: productController.isLiked(product.id)
                              ? Colors.red
                              : Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            ...List.generate(5, (index) {
              return Icon(
                index < product.rating ? Icons.star : Icons.star_border,
                size: 16.sp,
                color: index < product.rating ? Colors.amber : Colors.grey[300],
              );
            }),
            SizedBox(width: 4.w),
            Text(
              '(${product.reviews})',
              style: TextStyle(
                fontSize: 12.sp,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          product.brand,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          product.name.tr,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            if (product.originalPrice != null) ...[
              Text(
                '\$${product.originalPrice}',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(width: 4.w),
            ],
            Text(
              '\$${product.price}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
