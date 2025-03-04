import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redacted/redacted.dart';
import 'package:team1_khayat/core/app_assets.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/controller/profile_controller.dart';
import 'custom_circle_avatar.dart';

class CustomCirecleImage extends StatelessWidget {
  const CustomCirecleImage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find();

    return Obx(() {
      final user = profileController.userModel.value;
      final isLoading = profileController.isLoading.value;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           CustomCircleAvatar(
            path: AppAssets.imagetest,
            size: 80,
          ),
          const SizedBox(width: 16),
         Expanded( 
      child: isLoading
          ? _buildRedactedEffect(context)
          : _buildUserInfo(user),
    ),
        ],
      );
    });
  }

  Widget _buildRedactedEffect(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("")
            .redacted(context: context, redact: true),
      ],
    );
  }

  Widget _buildUserInfo(user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user?.name ?? "غير معروف",
          style: AppTextStyles.tajawaltextStyle16,
        ),
        Text(
          user?.email ?? "بريد غير متوفر",
          style: AppTextStyles.tajawaltextStyle14,
        ),
      ],
    );
  }
}
