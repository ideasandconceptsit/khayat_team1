import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';

import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/features/Catalog2/catalog_controller/product_controller.dart';
import 'package:team1_khayat/features/product/controllers/product_controller.dart';
import 'package:team1_khayat/features/product/controllers/reviews_controller.dart';
import 'package:team1_khayat/features/product/models/base_product_model.dart';
import 'package:team1_khayat/features/product/views/widgets/product_details_section.dart';
import 'package:team1_khayat/features/product/views/widgets/rating_review_section.dart';
import 'package:team1_khayat/features/product/views/widgets/size_color_and_favourite_row.dart';
import 'package:team1_khayat/features/product/views/widgets/write_review_fab.dart';
import 'package:team1_khayat/shared/custom_app_button/custom_app_button.dart';
import 'package:team1_khayat/shared/custom_cached_network_image/custom_cached_network_image.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

import 'images_list_section.dart';

class ProductCardBody extends StatefulWidget {
  const ProductCardBody({super.key, required this.productModel});

  final BaseProductModel productModel;

  @override
  State<ProductCardBody> createState() => _ProductCardBodyState();
}

class _ProductCardBodyState extends State<ProductCardBody> {

  @override
  void initState() {
    Get.put(ProductCardController(product: widget.productModel));
    Get.put(ReviewsController(product: widget.productModel));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ProductCardController productCardController = Get.find();

    return Column(children: [
      Expanded(
        child: Scaffold(
          floatingActionButton:  const WriteReviewFAB(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 ImagesListSection(),
                 const SizeColorAndFavouriteRow(),
                SizedBox(
                  height: 10.h,
                ),
                 ProductDetailsSection(),
                SizedBox(
                  height: 32.h,
                ),
                 RatingReviewSection()
              ],
            ),
          ),
        ),
      ),
      Obx(
        () => Container(
          color: AppColors.whiteColor,
          width: double.infinity,
          child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: CustomAppButton(
                  onTap: ()=>productCardController.addItemToCart(),
                  isLoading: productCardController.addItemToCartState.value == AppState.loading,
                            text: AppStrings.addToCart.tr,
                            width: 148.w,
                            height: 38.h,
                          ),
              )),
        ),
      ),
    ]);
  }
}
