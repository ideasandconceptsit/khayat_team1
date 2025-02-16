import 'package:flutter/material.dart';

import '../../../core/app_style.dart';

class SectionTitle extends StatelessWidget {

  const SectionTitle({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "New",
                style: AppStyle.navBar,
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () {
                  // عند الضغط على "View all"
                },
                child: const Text(
                    "you've never seen it before",
                    style: AppStyle.textButton1
                ),
              ),
            ],
          ),const Text(
              "View All",
              style:AppStyle.textButtonView
          ),
          //ItemList(),

        ],
      ),
    );
  }
}
