import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/service/api_service.dart';
import 'package:team1_khayat/features/profile/controller/shipping-address_controller.dart';
import 'package:team1_khayat/features/profile/repos/shipping_address_repos.dart';
import 'package:team1_khayat/features/profile/view/widget/add_adress_form.dart';
import 'package:team1_khayat/features/profile/view/widget/address_card.dart';
import 'package:team1_khayat/features/profile/view/widget/edit_address_form.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';
import 'package:team1_khayat/shared/floating_buton/custom_floating_button.dart';
import 'package:team1_khayat/shared/shimmer/redacted_effect.dart';

class ShippingAddressView extends StatelessWidget {
  ShippingAddressView({super.key});

  final ShippingAddressController controller = Get.put(
      ShippingAddressController(ShippingAddressRepository(ApiService())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        arrowBackVisibility: true,
        arrowBackOnPressed: () => Get.back(),
        backgroundColor: Colors.white,
        title: AppStrings.shippingAddresses.tr,
      ),
      body: Obx(() {
         if (controller.isLoading.value) {
          return const LoadingShimmerEffect();
        }
        else if (controller.addresses.isEmpty) {
          return const Center(child: Text("لم يتم العثور على أي عناوين."));
        } 

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final address = controller.addresses[index];
                    return AddressCard(
                      address: address,
                      isSelected:
                          controller.selectedAddressId.value == address.id,
                      onSelect: controller.setDefaultAddress,
                      // onEdit: controller.editAddress,
                    );
                  },
                  childCount: controller.addresses.length,
                ),
              ),
            ),
          ],
        );
      }),
      floatingActionButton: CustomFloatingButton(
        onPressed: () {
          // Get.to(() => AddAddressForm());
        },
        icon: Icons.add,
      ),
    );
  }
}
