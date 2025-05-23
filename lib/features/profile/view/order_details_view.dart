import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/profile/controller/my_order_controller.dart';
import 'package:team1_khayat/features/profile/model/order_model.dart';
import 'package:team1_khayat/features/profile/view/widget/build_item_list_order_details.dart';
import 'package:team1_khayat/features/profile/view/widget/build_order_info_list.dart';
import 'package:team1_khayat/features/profile/view/widget/header_order_details.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';

class OrderDetailsView extends StatelessWidget {
   OrderDetailsView({super.key,  this.order,  this.status});
    final String? status;

 final OrderModels? order; 

  final OrderController orderController = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        actionIconOnPressed: () {},
        title:  AppStrings.orderdetails.tr,
        arrowBackVisibility: true,
        // actionIcon: Icons.search_outlined,
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
              child: HeaderOrderDetails(
  order: order ?? OrderModels(), 
  status: status ?? 'غير محددة',
),

            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16.h,
              ),
            ),
            SliverToBoxAdapter(
              child: 
               Text.rich(
                TextSpan(
                  text: AppStrings.items.tr,
                  style: AppTextStyles.tajawaltextStyle14.copyWith(color: AppColors.grey1),
                  children: [
                    TextSpan(
                      text: ' ${order?.items?.length}',
                      style: AppTextStyles.tajawaltextStyle14.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ), 
             
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 13.h,
              ),
            ),
           SliverList.builder(
  itemCount: order?.items?.length ?? 0,
  itemBuilder: (context, index) {
    return BuildItemListOrderDetails(orderItem: order!.items![index]);
  },
),
           SliverList(delegate: SliverChildListDelegate([
               BuildOderInfoList( order: order),
            ])),
           
          ],
        ),
      );
        }
      }),
    );
  }
  
}