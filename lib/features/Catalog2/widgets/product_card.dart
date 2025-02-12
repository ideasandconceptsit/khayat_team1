import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        Expanded(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              if (product.discount != null)
                Positioned(
                  left: 8.w,
                  top: 8.h,
                  child: Container(
                    width: 40.w,
                    height: 24.h,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: 40.w,
                            height: 24.h,
                            decoration: ShapeDecoration(
                              color: Color(0xFFDB3022),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(29.r),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 5.w,
                          top: 3.h,
                          child: SizedBox(
                            width: 29.w,
                            child: Text(
                              '-${product.discount}%',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              Positioned(
                right: 8.w,
                top: 8.h,
                child: Obx(() => GestureDetector(
                      onTap: () => productController.toggleLike(product.id),
                      child: Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          productController.isLiked(product.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 20.sp,
                          color: productController.isLiked(product.id)
                              ? Colors.red
                              : Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    )),
              ),
            ],
          ),
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
