import 'package:flutter/material.dart';
import 'package:team1_khayat/features/profile/view/widget/body.dart';
import 'package:team1_khayat/shared/custom_app_bar/custom_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          appBar:  CustomAppBar(
         actionIcon: Icons.search_rounded,
          ),
      body: Body(),
    );
  }
  
}