import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';
import 'package:team1_khayat/shared/custom_floating_button/custom_floating_button.dart';
import '../controllers/shipping_address_controller.dart';
import 'widgets/address_card.dart';

class ShippingAddressesPage extends StatelessWidget {
  ShippingAddressesPage({super.key});

  final ShippingController controller = Get.put(ShippingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
            arrowBackVisibility: true,
            arrowBackOnPressed: () {
              Get.back();
            },
            backgroundColor: Colors.white,
            title: 'shipping_addresses'.tr),
        body: Obx(() => ListView.builder(
              itemCount: controller.addresses.length,
              itemBuilder: (context, index) {
                final address = controller.addresses[index];
                return AddressCard(
                  address: address,
                  isSelected: controller.selectedAddressId.value == address.id,
                  onSelect: controller.setDefaultAddress,
                  onEdit: controller.editAddress,
                );
              },
            )),
        floatingActionButton: CustomFloatingButton(
            onPressed: () {
              controller.addNewAddress();
            },
            icon: Icons.add));
  }
}
