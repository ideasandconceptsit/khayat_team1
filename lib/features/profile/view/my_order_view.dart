import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/profile/controller/my_order_controller.dart';
import 'package:team1_khayat/features/profile/view/widget/build_category_section.dart';
import 'package:team1_khayat/features/profile/view/widget/order_pages.dart';
import 'package:team1_khayat/features/profile/view/widget/order_search_deleget.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';
import 'package:team1_khayat/shared/shimmer/shimmer_effect.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
  final OrderController orderController = Get.put(OrderController());
  int selectedIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          actionIconOnPressed: () {
            showSearch(context: context, delegate: SearchOrderDelegate());
          },
          actionIcon: Icons.search_rounded,
          arrowBackVisibility: true,
        ),
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(height: 16),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    BuildCategorySection(
                      selectedIndex: selectedIndex,
                      onCategorySelected: updateIndex,
                    )
                  ],
                ),
              ),
            ),
            Obx(() {
              if (orderController.isLoading.value) {
                return const SliverFillRemaining(
                  child: LoadingShimmerEffect(),
                );
              } else if (orderController.orders.isEmpty) {
                return SliverFillRemaining(
                  child: Center(
                    child: Text(
                      AppStrings.noOrder.tr,
                    ),
                  ),
                );
              } else {
                return SliverFillRemaining(
                  child: OrderPages(
                    selectedIndex: selectedIndex,
                    orders: orderController.orders,
                  ),
                );
              }
            }),
          ],
        ));
  }

  void updateIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
