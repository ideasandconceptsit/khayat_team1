import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/core/app_styles.dart';
import 'package:team1_khayat/core/services/api_service.dart';
import 'package:team1_khayat/core/utils/app_colors.dart';
import 'package:team1_khayat/features/profile/controller/create_order_controller.dart';
import 'package:team1_khayat/features/profile/model/order_model.dart';
import 'package:team1_khayat/features/profile/repos/create_order_repos.dart';
import 'package:team1_khayat/features/profile/view/widget/order_info.dart';
import 'package:team1_khayat/shared/bottom_navigation_bar/view/buttom_nav_bar.dart';

class BuildOderInfoList extends StatelessWidget {
  BuildOderInfoList({super.key, this.order, this.itemModel});
  final OrderModels? order;
  final ItemModel? itemModel;
  final CreateOrderController createOrderController =
      Get.put(CreateOrderController(CreateOrderRepository(ApiService())));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: AppColors.grey),
        const SizedBox(height: 10),
        Text(
          AppStrings.orderInformation.tr,
          style: AppTextStyles.tajawaltextStyle14,
        ),
        const SizedBox(height: 10),
        OrderInfo(
          title: AppStrings.shippingAddresses.tr,
          value: '${order!.client!.address ?? ''}', // التأكد من وجود العنوان
        ),
        OrderInfo(
          title: AppStrings.paymentMethods.tr,
          value: '${order!.paymentMethod ?? ''} ', // التأكد من وجود طريقة الدفع
          icon: Icons.credit_card,
        ),
        OrderInfo(
          title: AppStrings.delivreymethod.tr,
          value: 'FedEx, 3 days, 15\$',
        ),
        OrderInfo(
          title: AppStrings.discount.tr,
          value: '${order!.discount ?? 0}%  ', // التأكد من وجود قيمة الخصم
        ),
        OrderInfo(
          title: AppStrings.totalAmount.tr,
          value:
              '${order!.totalPrice ?? 0}\$', // التأكد من وجود المبلغ الإجمالي
          isBold: true,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(AppColors.green),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1),
                    ),
                  ),
                ),
                onPressed: () {
                  // بناء البيانات للإرسال بناءً على البيانات من Postman
                  final orderData = {
                    "data": {
                      "client": "67e40d7f3881030f70eff227", // العميل
                      "items": [
                        {
                          "itemType": "Fabric", // نوع المنتج
                          "item": "67bf95083024aff9082e7537", // ID المنتج
                          "quantity": 5, // الكمية
                          "unitPrice": 150.75, // سعر الوحدة
                          "discount": 0, // الخصم
                          "totalPrice": 753.75, // السعر الكلي
                          "_id":
                              "67f3ede2ce9bf7d0e734446b", // ID المنتج (قد يكون هذا مفتاح خاص بـ API)
                          "id": "67f3ede2ce9bf7d0e734446b" // ID المنتج
                        }
                      ],
                      "discount": 10, // الخصم الإجمالي
                      "discountType": "fixed", // نوع الخصم
                      "tax": 0, // الضرائب
                      "taxRate": 0, // نسبة الضريبة
                      "shipping": 0, // تكلفة الشحن
                      "totalPrice": 743.75, // السعر الإجمالي بعد الخصم
                      "paymentStatus": "unpaid", // حالة الدفع
                      "paymentMethod": "cash", // طريقة الدفع
                      "amountPaid": 0, // المبلغ المدفوع
                      "status": "pending", // حالة الطلب
                      "priority": "normal", // أولوية الطلب
                      "tags": [], // العلامات (إن وجدت)
                      "_id": "67f3ede2ce9bf7d0e734446a", // ID الطلب
                      "totalQuantity": 5, // الكمية الإجمالية
                      "balance": 743.75, // الرصيد المتبقي
                      "orderDate": "2025-04-07T15:23:14.196Z", // تاريخ الطلب
                      "createdAt": "2025-04-07T15:23:14.197Z", // تاريخ الإنشاء
                      "updatedAt": "2025-04-07T15:23:14.197Z", // تاريخ التحديث
                      "orderNumber": "ORD-2504-0004", // رقم الطلب
                      "trackingNumber": "TRK-250407-958311", // رقم التتبع
                      "__v": 0, // النسخة
                      "id": "67f3ede2ce9bf7d0e734446a" // ID الطلب
                    }
                  };

                  // استدعاء createOrder مع البيانات
                  createOrderController.createOrder(orderData);
                },
                child: Text(
                  AppStrings.reorder.tr,
                  style: const TextStyle(color: AppColors.whiteColor),
                ),
              ),
            ),
            //    const SizedBox(width: 10),
            // Expanded(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Get.offAll(() =>BottomNavBar());
            //       Get.to(() => BottomNavBar());
            //     },
            //     style: ButtonStyle(
            //       backgroundColor:
            //           WidgetStateProperty.all<Color>(AppColors.green),
            //       shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            //         RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(1),
            //         ),
            //       ),
            //     ),
            //     child: Text(
            //       AppStrings.home.tr,
            //       style: const TextStyle(color: Colors.white),
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
