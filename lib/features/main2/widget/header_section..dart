import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/a23cb8294ba48ae7e1ff9a0aadbc2103.jpg", fit: BoxFit.cover
        ,height: 196,),
      ],
    );
  }
}
