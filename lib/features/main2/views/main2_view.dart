import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:team1_khayat/features/main2/views/widget/header_section.dart';
import 'package:team1_khayat/features/main2/views/widget/item_list_view.dart';
import 'widget/first-title.dart';
import 'widget/section_title.dart';

class Main2 extends StatelessWidget {
  Main2({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: HeaderSection()),
            const SliverToBoxAdapter(child: FirstTitle()),
            SliverToBoxAdapter(child: SizedBox(height: 8.h)),
            const SliverToBoxAdapter(child: ItemList()), 
            const SliverToBoxAdapter(child: SectionTitlee()),
            const SliverToBoxAdapter(child: ItemList()), 
          ],
        ),
      ),
    );
  }
}