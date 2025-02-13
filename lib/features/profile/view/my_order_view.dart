import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:team1_khayat/core/utils/app_assets.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/core/widget/navigation_service.dart';
import 'package:team1_khayat/features/profile/view/widget/build_category_section.dart';
import 'package:team1_khayat/features/profile/view/widget/order_pages.dart';
import 'package:team1_khayat/shared/my_appbar/custom_app_bar.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
      int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: _buildAppBar(context),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          SliverToBoxAdapter(
            child: BuildCategorySection(
              selectedIndex: selectedIndex,
              onCategorySelected: updateIndex,
            ),
          ),
          SliverFillRemaining(
            child: OrderPages(selectedIndex: selectedIndex)
          ),
        ],
      ),
    );
  }
  
   PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 69.h,
      leading: IconButton(
        icon:SvgPicture.asset(
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
   void updateIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}