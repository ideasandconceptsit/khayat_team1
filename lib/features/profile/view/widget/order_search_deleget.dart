import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/profile/controller/my_order_controller.dart';
import 'package:team1_khayat/features/profile/view/order_details_view.dart';

class SearchOrderDelegate extends SearchDelegate<String> {
  final OrderController orderController = Get.find<OrderController>();

  @override
  String? get searchFieldLabel => "بحث عن الطلبات"; 

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; 
          orderController.clearSearch(); 
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); 
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    orderController.searchOrder(query); 
    return Obx(() {
      if (orderController.isLoading.value) {
        return const Center(child:  CircularProgressIndicator());
      } else if (orderController.filteredFavorites.isEmpty) {
        return const Center(child: Text("لا توجد نتائج للبحث"));
      } else {
        return ListView.builder(
          itemCount: orderController.filteredFavorites.length,
          itemBuilder: (context, index) {
            final order = orderController.filteredFavorites[index];
            return ListTile(
              title: Text(order.orderNumber ?? 'رقم الطلب غير متوفر'),
              subtitle: Text(order.trackingNumber ?? 'رقم التتبع غير متوفر'),
            
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailsView(order: order,
                    status: order.status ?? 'حالة الطلب غير متوفرة',
                    ),
                  ),
                );
              },
            );
          },
        );
      }
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: orderController.filteredFavorites.length,
        itemBuilder: (context, index) {
          final order = orderController.filteredFavorites[index];
          return ListTile(
            onTap: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrderDetailsView(order: order,
                  status: order.status ?? 'حالة الطلب غير متوفرة',
                  ),
                ),
              );
            },
            title: Text(order.orderNumber ?? 'رقم الطلب غير متوفر'),
            subtitle: Text(order.trackingNumber ?? 'رقم التتبع غير متوفر'),
          );
        },
      );
    });
  }
}
