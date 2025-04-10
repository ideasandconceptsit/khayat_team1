import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/shared/custom_cached_network_image/custom_cached_network_image.dart';

class ImagesListSection extends StatelessWidget {
  const ImagesListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 413.h,
      width: double.infinity,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          CustomCachedNetworkImage(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSOjItEhrWG1NL643qQO8ynHOR1ioblcyUtA&s", height: 413.h, width: double.infinity),
          CustomCachedNetworkImage(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSOjItEhrWG1NL643qQO8ynHOR1ioblcyUtA&s", height: 413.h, width: double.infinity,),
          CustomCachedNetworkImage(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSOjItEhrWG1NL643qQO8ynHOR1ioblcyUtA&s", height: 413.h, width: double.infinity,),
          CustomCachedNetworkImage(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSOjItEhrWG1NL643qQO8ynHOR1ioblcyUtA&s", height: 413.h, width: double.infinity,),
          CustomCachedNetworkImage(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSOjItEhrWG1NL643qQO8ynHOR1ioblcyUtA&s", height: 413.h, width: double.infinity,),
        ],

      ),
    );
  }
}