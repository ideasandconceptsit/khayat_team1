import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/product/controllers/product_controller.dart';
import 'package:team1_khayat/features/product/views/widgets/color_drop_menu.dart';
import 'package:team1_khayat/shared/custom_mini_circle_button/custom_mini_circle_button.dart';
import 'package:team1_khayat/state_managment/app_status.dart';

class SizeColorAndFavouriteRow extends StatelessWidget {
  const SizeColorAndFavouriteRow({super.key});

  @override
  Widget build(BuildContext context) {
    ProductCardController productCardController = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.h),
      child:  Row(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsetsDirectional.only(end: 16.w),
              child: (productCardController.product.sizes?.isNotEmpty ?? false)
                  ? CustomDropMenu(
                      onChange: (size) => productCardController
                          .changeProductSizeOrColor(size: size),
                      selectedValue:
                          productCardController.selectedProductSize.value,
                      title: productCardController.product.sizes!.first,
                      values: productCardController.product.sizes!,
                    )
                  : const SizedBox(),
            )),
            if (productCardController.product.colors?.isNotEmpty ?? false)
              Expanded(
                  child: Padding(
                padding: EdgeInsetsDirectional.only(end: 16.w),
                child: (productCardController.product.colors?.isNotEmpty ??
                        false)
                    ? CustomDropMenu(
                        onChange: (color) {
                          productCardController
                            .changeProductSizeOrColor(color: color);
                          productCardController.changePageViewIndex(productCardController.product.colors!.indexOf(color!));

                        },
                        selectedValue:
                            productCardController.selectedProductColor.value,
                        title: productCardController.product.colors!.first,
                        values: productCardController.product.colors!,
                      )
                    : const SizedBox(),
              )),
            Obx(
              () => CustomMiniCircleButton(
                isLoading: productCardController.addToFavoritesState.value ==
                    AppState.loading,
                icon: Icons.favorite_border,
                onTap: () {
                  productCardController.addToFavorites();
                },
              ),
            )
          ],
        ),
    );
  }
}
