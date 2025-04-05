import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redacted/redacted.dart';

class LoadingShimmerEffect extends StatelessWidget {
  final int itemCount;

  const LoadingShimmerEffect({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return const LoadingShimmerItem();
      },
    );
  }
} 

class LoadingShimmerEffecthorizontal extends StatelessWidget {
  final int itemCount;

  const LoadingShimmerEffecthorizontal({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      width: 190.w,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return const LoadingShimmerItem();
        },
      ),
    );
  }
}

class LoadingShimmerItem extends StatelessWidget {
  const LoadingShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRedactedBox(context, height: 20, width: 100),
              const SizedBox(height: 8),
              _buildRedactedBox(context, height: 14, width: 150),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRedactedBox(context, height: 14, width: 50),
                  _buildRedactedBox(context, height: 14, width: 80),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRedactedBox(context, height: 30, width: 100),
                  _buildRedactedBox(context, height: 14, width: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildRedactedBox(BuildContext context, {required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      color: Colors.grey[300],
    ).redacted(context: context, redact: true);
  }
}

class LoadingTextEffect extends StatelessWidget {
  const LoadingTextEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("").redacted(context: context, redact: true),
      
      ],
    );
  }
}
