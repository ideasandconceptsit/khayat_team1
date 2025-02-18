import 'package:flutter/material.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';


class ProfileOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  ProfileOption({required this.title, required this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: AppTextStyles.tajawaltextStyle16.copyWith(
              color: AppColors.black
            ),
          ),
          subtitle: Text(
            subtitle,
            style: AppTextStyles.tajawaltextStyle11,
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          onTap: onTap,
        ),
        Divider(color: AppColors.black1),
      ],
    );
  }
}