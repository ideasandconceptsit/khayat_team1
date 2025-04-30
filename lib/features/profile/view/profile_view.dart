import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/services/api_service.dart';
import 'package:team1_khayat/features/cart/controllers/payment_controller.dart';
import 'package:team1_khayat/features/profile/controller/profile_controller.dart';
import 'package:team1_khayat/features/profile/repos/profile_repository.dart';
import 'package:team1_khayat/features/profile/view/widget/body.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';

class ProfileView extends StatelessWidget {
   ProfileView({super.key});
  final PaymentController paymentController = Get.put(PaymentController());


  @override
  Widget build(BuildContext context) {
        Get.put(ProfileController(ProfileRepository(ApiService())));
    return  const Scaffold(
          appBar:  CustomAppBar( 
        //     actionIconOnPressed: () {},
        //  actionIcon: Icons.search_rounded,
          ),
      body: Body(),
    );
  }
  
}