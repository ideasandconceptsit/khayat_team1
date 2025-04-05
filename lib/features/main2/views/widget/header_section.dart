import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 196,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/a23cb8294ba48ae7e1ff9a0aadbc2103.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      
    );
   
  }
}