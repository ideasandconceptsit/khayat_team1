
import 'package:flutter/material.dart';

class Categrs extends StatelessWidget {
  String textname;
   Categrs({required this.textname});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26,vertical: 7),
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.black,
      ),
      child: Text(
        textname,
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),);
  }
}
