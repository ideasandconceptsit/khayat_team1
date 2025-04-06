import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/favorite/controller/favorite_controller.dart';
import 'package:team1_khayat/features/favorite/repos/favorite_repos.dart';
import 'package:team1_khayat/features/main2/controller/product_controller.dart';
import 'package:team1_khayat/features/main2/views/widget/header_section.dart';
import 'package:team1_khayat/features/main2/views/widget/fabric_item_list_view.dart';
import 'package:team1_khayat/features/main2/views/widget/second_title.dart';
import 'package:team1_khayat/shared/shimmer/redacted_effect.dart';
import 'widget/accessories_item_list.dart';
import 'widget/first-title.dart';

class Main2 extends StatelessWidget {
  Main2({super.key});
  final ProductController _controller = Get.put(ProductController());
  final FavoriteController _favoritecontroller = Get.put(FavoriteController(FavoriteRepository()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: HeaderSection()),
            const SliverToBoxAdapter(child: FirstTitle()),
            SliverToBoxAdapter(child: SizedBox(height: 8.h)),

            Obx(() {
              return SliverToBoxAdapter(
                child: _controller.isLoading.value
                    ? const LoadingShimmerEffecthorizontal()
                    : _controller.fabricList.isEmpty
                        ? Center(
                            child: Text(AppStrings.noCouponsAvailable.tr),
                          )
                        : FebricItemList(fabricList: _controller.fabricList),
              );
            }),

            const SliverToBoxAdapter(child: SecondTitle()),
            Obx(() {
              return SliverToBoxAdapter(
                child: _controller.isLoading.value
                    ? const LoadingShimmerEffecthorizontal()
                    : _controller.accessoriesList.isEmpty
                        ? Center(
                            child: Text(AppStrings.noCouponsAvailable.tr),
                          )
                        : AccessoriesItemList(accessoriesList: _controller.accessoriesList),
              );
            }),
          ],
        ),
      ),
    );
  }
}
