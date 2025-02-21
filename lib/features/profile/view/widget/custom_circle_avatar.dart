import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final String path;
  final double size;
  final Widget? child;

  const CustomCircleAvatar({
    Key? key,
    required this.path,
    this.size = 80,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              path,
              width: size,
              height: size,
              fit: BoxFit.cover,
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
