import 'package:flutter/material.dart';
import 'package:team1_khayat/core/utils/app_assets.dart';
import 'package:team1_khayat/core/utils/app_text_style.dart';
import 'package:team1_khayat/features/profile/view/widget/custom_circle_avatar.dart';

class CustomCirecleImage extends StatelessWidget {
  const CustomCirecleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
                children: [
                 CustomCircleAvatar(
                    path: AppAssets.imagetest,
                    size: 80,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mohamed',
                        style: AppStyles.tajawaltextStyle16
                      ),
                      Text(
                        'mohamed@mail.com',
                        style: AppStyles.tajawaltextStyle14
                      ),
                    ],
                  ),
                ],
              );
  }
}