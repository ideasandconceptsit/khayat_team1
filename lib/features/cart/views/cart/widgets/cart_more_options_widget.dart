import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/cart/controllers/cart_controller.dart';
import 'package:team1_khayat/features/cart/models/cart_product_model.dart';
import 'package:team1_khayat/features/favorites/favorite_controller/favorite_controller.dart';
import 'package:team1_khayat/features/favorites/models/favorite_model.dart';

class CartMoreOptionsWidget extends StatelessWidget {
  const CartMoreOptionsWidget({
    super.key,
    required this.cartItemModel,
  });

  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find<CartController>();
    final FavoriteControllerOld favoriteControllerOld = Get.find();

    return Obx(
      () {
        FavoriteItem? favItem = favoriteControllerOld.allFavorites
            .where((p0) => cartItemModel.product.id == p0.id)
            .firstOrNull;
        return PopupMenuButton(
          shadowColor: AppColors.promoCodeMenuShadowColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          menuPadding: EdgeInsets.zero,
          color: AppColors.whiteColor,
          // 12 is the padding
          // 33 and 17 is the the space and the padding in Figma
          offset: Offset(-33.w + 12.w, -17 - 12.h),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints.tight(Size(170.w, 96.h)),
          itemBuilder: (context) => [
            _buildPopupMenuItem(
                text: _getButtonText(favItem),
                onTap: () {
                  if (favoriteControllerOld.isLoading.value == false) {
                    if (favItem == null) {
                      cartController.addToFavorites(
                          cartItemModel.product.id, cartItemModel.productType);
                    } else {
                      cartController.removeFromFavorites(
                          cartItemModel.product.id, cartItemModel.productType);
                    }
                  }
                }),
            _buildPopupMenuItem(
                text: AppStrings.deleteFromList.tr,
                onTap: () => cartController
                    .deleteProductFromCart(cartItemModel.product.id)),
          ],
          child: const Icon(
            Icons.more_vert,
            color: AppColors.greyColor,
          ),
        );
      },
    );
  }

  String _getButtonText(FavoriteItem? favItem) {
    final FavoriteControllerOld favoriteControllerOld = Get.find();
    if (favoriteControllerOld.isLoading.value) {
      return AppStrings.loading.tr;
    } else if (favItem == null) {
      return AppStrings.addToFavorites.tr;
    }
    return AppStrings.removeFromFavorites.tr;
  }

  PopupMenuItem<dynamic> _buildPopupMenuItem(
      {required String text, required void Function()? onTap}) {
    return PopupMenuItem(
      onTap: onTap,
      padding: EdgeInsets.zero,
      child: Center(
        child: Text(text, style: AppTextStyles.textStyleRegular11),
      ),
    );
  }
}
