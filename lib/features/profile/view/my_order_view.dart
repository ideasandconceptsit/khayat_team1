import 'package:flutter/material.dart';
import 'package:team1_khayat/features/profile/view/widget/build_category_section.dart';
import 'package:team1_khayat/features/profile/view/widget/order_pages.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';

class MyOrderView extends StatefulWidget {
  const MyOrderView({super.key});

  @override
  State<MyOrderView> createState() => _MyOrderViewState();
}

class _MyOrderViewState extends State<MyOrderView> {
      int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        actionIcon:Icons.search_rounded ,
        arrowBackVisibility: true,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
          SliverToBoxAdapter(
            child: BuildCategorySection(
              selectedIndex: selectedIndex,
              onCategorySelected: updateIndex,
            ),
          ),
          SliverFillRemaining(
            child: OrderPages(selectedIndex: selectedIndex)
          ),
        ],
      ),
    );
  }
  
  
   void updateIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}