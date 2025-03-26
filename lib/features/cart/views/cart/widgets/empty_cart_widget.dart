import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/core/app_assets.dart';
import 'package:team1_khayat/core/app_strings.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppAssets.emptyCartImage),
        Text(AppStrings.pleaseAddSomeProductsFirst.tr)
      ],
    );
  }
}