import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../models/favorite_model.dart';

class FavoriteProductCard extends StatelessWidget {
  final FavoriteItem favoriteItem;
  final VoidCallback onRemove;

  const FavoriteProductCard({
    super.key,
    required this.favoriteItem,
    required this.onRemove,
  });

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
              child: CachedNetworkImage(
                imageUrl: favoriteItem.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150.h,
                placeholder: (context, url) => Container(
                  color: Colors.grey[200],
                  child: Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/fabric.jpeg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150.h,
                ),
              ),
            ),
            if (favoriteItem.discount > 0)
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
                    '-${favoriteItem.discount}%',
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
              top: 8.h,
              child: GestureDetector(
                onTap: onRemove,
                child: Container(
                  padding: EdgeInsets.all(6.w),
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
                  child: Icon(
                    Icons.delete_outline,
                    size: 20.sp,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          favoriteItem.category.name,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          favoriteItem.name,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            if (favoriteItem.discount > 0) ...[
              Text(
                '\$${favoriteItem.pricePerUnit.toStringAsFixed(2)}',
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
              '\$${(favoriteItem.pricePerUnit * (1 - favoriteItem.discount / 100)).toStringAsFixed(2)}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          '${favoriteItem.quantity} ${favoriteItem.unit.tr}',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 12.sp,
          ),
        ),
        if (favoriteItem.isLowStock)
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Text(
              'low_stock'.tr,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
          ),
      ],
    );
  }
}
