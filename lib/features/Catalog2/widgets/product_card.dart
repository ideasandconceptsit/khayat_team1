import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../catalog_controller/product_controller.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;

  ProductCard({super.key, required this.productModel});

  final ProductController productController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.network(
                productModel.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150.h,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/fabric.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 150.h,
                  );
                },
              ),
            ),
            if (productModel.discount > 0)
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
                    '-${productModel.discount}%',
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
                        onTap: () => productController.toggleLike(
                          productModel.id,
                          productModel.type,
                        ),
                        child: Icon(
                          productController.isLiked(productModel.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 24.sp,
                          color: productController.isLiked(productModel.id)
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
                index < (productModel.ratingsAverage ?? 0)
                    ? Icons.star
                    : Icons.star_border,
                size: 16.sp,
                color: index < (productModel.ratingsAverage ?? 0)
                    ? Colors.amber
                    : Colors.grey[300],
              );
            }),
            SizedBox(width: 4.w),
            Text(
              '(${productModel.ratingsQuantity ?? 0})',
              style: TextStyle(
                fontSize: 12.sp,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          productModel.category.name,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          productModel.name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            if (productModel.discount > 0) ...[
              Text(
                '\$${productModel.price.toStringAsFixed(2)}${productModel.unit == 'meter' ? '/m' : ''}',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  decorationThickness: 1,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(width: 4.w),
            ],
            Text(
              '\$${productModel.finalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        // Add quantity information
        SizedBox(height: 4.h),
        //  Text(
        //       'Quantity: ${fabric.quantity}',
        //       style: TextStyle(
        //         color: Theme.of(context).colorScheme.secondary,
        //      fontSize: 12.sp,
        //       ),
        //     ),
      ],
    );
  }
}
