import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/shared/custom_cached_network_image/custom_cached_network_image.dart';

class ImagesListSection extends StatelessWidget {
  const ImagesListSection({super.key, this.images});

  final List<String>? images;

  @override
  Widget build(BuildContext context) {
    return images != null
        ? SizedBox(
            height: 413.h,
            width: double.infinity,
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: images!
                  .map(
                    (e) => CustomCachedNetworkImage(
                        imageUrl: e, height: 413.h, width: double.infinity),
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
            child: const Column(mainAxisAlignment: MainAxisAlignment.center,children: [Icon(Icons.error_outline),Text("No Images")]),);
  }
}
