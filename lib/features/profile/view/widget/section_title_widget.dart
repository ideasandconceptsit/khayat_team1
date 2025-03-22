import 'package:flutter/material.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/view/widget/language_toggle.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;
  final bool showToggle;

  const SectionTitle({
    Key? key,
    required this.title,
    this.actionText,
    this.onActionTap,
    this.showToggle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(title, style: AppTextStyles.tajawaltextStyle16),
          const Spacer(),
          if (showToggle) LanguageToggle(),
          if (actionText != null)
            GestureDetector(
              onTap: onActionTap,
              child: Text(actionText!, style: AppTextStyles.tajawaltextStyle14),
            ),
        ],
      ),
    );
  }
}
