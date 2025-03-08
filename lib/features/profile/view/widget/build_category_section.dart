// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:team1_khayat/core/app_strings.dart';
import 'package:team1_khayat/features/profile/view/widget/build_category_item.dart';

class BuildCategorySection extends StatelessWidget {

  final int selectedIndex;
  final Function(int) onCategorySelected;
  const BuildCategorySection({
    Key? key,
    required this.selectedIndex,
    required this.onCategorySelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            BuildCategoryItem(
                text:  AppStrings.delivered, index: 0, selectedIndex: selectedIndex, onTap: onCategorySelected),
            const SizedBox(width: 8),
            BuildCategoryItem(
                text: AppStrings.processing, index: 1, selectedIndex: selectedIndex, onTap: onCategorySelected),
            const SizedBox(width: 8),
            BuildCategoryItem(
                text:  AppStrings.cancelled, index: 2, selectedIndex: selectedIndex, onTap: onCategorySelected),
          
          ],
        ),
      );
    
  }

  
}
