import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:team1_khayat/core/app_colors.dart';

// Created this widget with reusability in mind to be used across the app,
// and make circularBorderRadius flexible
class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.circularBorderRadius = 0, this.fit,
  });

  final String imageUrl;
  final double height;
  final double width;
  final double circularBorderRadius;
  final BoxFit? fit;



  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(circularBorderRadius),
          image: DecorationImage(
            image: imageProvider,
            fit: fit??BoxFit.cover,
          ),
        ),
      ),
      imageUrl: imageUrl,
      placeholder: (context, url) => Skeletonizer(
          child: Container(
            height: height,
            width: width,
            color: AppColors.scaffoldBackgroundColor,
          )),
      errorWidget: (context, url, error) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(circularBorderRadius),
          ),
          child: const Icon(Icons.error_outline)),
    );
  }
}