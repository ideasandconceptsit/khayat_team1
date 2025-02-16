import 'package:flutter/material.dart';
import 'package:team1_khayat/features/main2/widget/bottom_nav_bar.dart';
import 'package:team1_khayat/features/main2/widget/frist_title.dart';
import 'package:team1_khayat/features/main2/widget/header_section..dart';
import 'package:team1_khayat/features/main2/widget/item_list_view.dart';
import 'package:team1_khayat/features/main2/widget/section_title.dart';

class Main2 extends StatelessWidget {
  Main2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: const SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeaderSection(),
              FirstTitle(),
              SizedBox(height: 8),
              ItemList(),
              SectionTitle(),
              ItemList(),
            ],
          ),
        ),
      ),
    );
  }
}
