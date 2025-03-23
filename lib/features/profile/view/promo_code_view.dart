import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/profile/controller/copun_controller.dart';
import 'package:team1_khayat/features/profile/view/widget/coupon_card.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';
import 'package:team1_khayat/shared/shimmer/redacted_effect.dart';

class PromoCodeView extends StatelessWidget {
  final CouponsController _controller = Get.put(CouponsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(
        actionIconOnPressed: () {},
        title:  AppStrings.promoCodeTitle.tr,
        arrowBackVisibility: true,
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const LoadingShimmerEffect();
        }

        if (_controller.coupons.isEmpty) {
          return Center(child: Text(AppStrings.noCouponsAvailable.tr)); // استخدام الترجمة
        }

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final coupon = _controller.coupons[index];
                    return CouponCard(coupon: coupon);
                  },
                  childCount: _controller.coupons.length,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
 

