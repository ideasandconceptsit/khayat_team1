import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';

class LoadingOrderList extends StatelessWidget {
  const LoadingOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6, 
      itemBuilder: (context, index) {
        return const LoadingOrderItem();
      },
    );
  }
}

class LoadingOrderItem extends StatelessWidget {
  const LoadingOrderItem({super.key});

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
              Container(height: 20, width: 100, color: Colors.grey[300])
                  .redacted(context: context, redact: true),
              const SizedBox(height: 8),
              Container(height: 14, width: 150, color: Colors.grey[300])
                  .redacted(context: context, redact: true),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 14, width: 50, color: Colors.grey[300])
                      .redacted(context: context, redact: true),
                  Container(height: 14, width: 80, color: Colors.grey[300])
                      .redacted(context: context, redact: true),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 30, width: 100, color: Colors.grey[300])
                      .redacted(context: context, redact: true),
                  Container(height: 14, width: 50, color: Colors.grey[300])
                      .redacted(context: context, redact: true),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
