import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/profile/view/widget/custom_cirecle_image.dart';
import 'package:team1_khayat/features/profile/view/widget/sliver_list_profile_option.dart';

import 'header_view_widget.dart';


class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: HeaderSection(text: AppStrings.myProfile)),
                  SliverToBoxAdapter(
                  child: SizedBox(height: 17.h),
                ),             
                 const SliverToBoxAdapter(
                  child: CustomCirecleImage(),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(height: 37.h),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                  [const SliverListProfileOption()],
                  ),
                ),
                ],
            ),
          );
  }
}