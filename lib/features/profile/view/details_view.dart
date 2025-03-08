import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_colors.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/profile/controller/my_order_controller.dart';
import 'package:team1_khayat/features/profile/model/order_model.dart';
import 'package:team1_khayat/features/profile/view/widget/build_item_list_order_details.dart';
import 'package:team1_khayat/features/profile/view/widget/build_order_info_list.dart';
import 'package:team1_khayat/features/profile/view/widget/header_order_details.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';

class DetailsView extends StatelessWidget {
   DetailsView({super.key,  this.order});
 
 final OrderModels? order; 

 final OrderController orderController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        actionIconOnPressed: () {},
        title:  AppStrings.orderdetails,
        arrowBackVisibility: true,
        actionIcon: Icons.search_outlined,
      ),
      body:Obx(() {
        if (orderController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return  Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: HeaderOrderDetails(order: order!),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
              ),
            ),
            SliverToBoxAdapter(
              child: Text( AppStrings.items,
                  style: AppTextStyles.tajawaltextStyle14
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
                return  BuildItemListOrderDetails(order: order);
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
      );
        }
      }),
    );
  }
  
}