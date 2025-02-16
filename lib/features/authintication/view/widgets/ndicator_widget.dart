import 'package:flutter/material.dart';

Widget buildHomeIndicator() {
  return GestureDetector(
    onTap: (){},
    child: Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: 134,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
