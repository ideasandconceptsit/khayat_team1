import 'package:flutter/material.dart';

import '../../../core/app_style.dart';
class FirstTitle extends StatelessWidget {
  const FirstTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const  Text(
                  "Sale",
                  style:AppStyle.navBar
              ),
              const SizedBox(height: 4),
              GestureDetector(
                onTap: () {
                  // عند الضغط على "View all"
                },
                child: const Text(
                    "View all",
                    style:AppStyle.textButtonView
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // عند الضغط على "Book an Appointment"
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
                "Book an Appointment",
                style: AppStyle.textInButton
            ),
          ),
        ],
      ),
    );
  }
}
