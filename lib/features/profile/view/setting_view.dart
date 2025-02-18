import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/view/widget/header_view_widget.dart';
import 'package:team1_khayat/features/profile/view/widget/seting_personal_section.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        actionIcon: Icons.search_rounded,
        arrowBackVisibility: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: HeaderSection(text: 'Setting')),
            SliverToBoxAdapter(
              child: SizedBox(height: 15.h),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [const SettingsPersonalInformationSection(),
                

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
