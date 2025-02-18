import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:team1_khayat/core/utils/app_assets.dart';
import 'package:team1_khayat/features/profile/view/widget/body.dart';
import 'package:team1_khayat/shared/my_appbar/custom_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
          appBar: _buildAppBar(context),
      body: const Body(),
    );
  }
   PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 69.h,
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            AppAssets.iconsSearch,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}