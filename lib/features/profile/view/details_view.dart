import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:team1_khayat/core/utils/app_assets.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/core/utils/app_text_style.dart';
import 'package:team1_khayat/core/widget/navigation_service.dart';
import 'package:team1_khayat/features/profile/view/widget/build_item_list_order_details.dart';
import 'package:team1_khayat/features/profile/view/widget/build_order_info_list.dart';
import 'package:team1_khayat/features/profile/view/widget/header_order_details.dart';
import 'package:team1_khayat/shared/my_appbar/custom_app_bar.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: HeaderOrderDetails(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Text('3 items',
                  style: AppStyles.tajawaltextStyle14
                      .copyWith(color: AppColors.grey)),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 13.h,
              ),
            ),
            SliverList.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return const BuildItemListOrderDetails();
              },
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [const BuildOderInfoList()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
   PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      backgroundColor: AppColors.white,
      centerTitle: true,
      leadingWidth: 69.h,
      title: Text('Order Details', style: AppStyles.tajawaltextStyle18),
      leading: IconButton(
        icon: SvgPicture.asset(
          AppAssets.arrowback,
        ),
        onPressed: () {
          NavigationService.back();
        },
      ),
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