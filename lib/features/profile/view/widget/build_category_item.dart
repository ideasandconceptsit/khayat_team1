import 'package:flutter/material.dart';

class BuildCategoryItem extends StatelessWidget {
  final String text;
  final int index;
  final int selectedIndex;
  final Function(int) onTap;

  BuildCategoryItem({required this.text, required this.index, required this.selectedIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: selectedIndex == index ? Colors.grey.shade900 : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: selectedIndex == index ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}