import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team1_khayat/features/profile/controller/review_controller.dart';

class RatingBarWidget extends StatelessWidget {
  final reviewController = Get.find<ReviewsController>();

  @override
  Widget build(BuildContext context) {
    if (reviewController.reviews.isEmpty) {
      return const Center(child: Text("لا توجد تقييمات حتى الآن"));
    }

    List<int> ratings = reviewController.reviews.map((e) => e.ratings).toList();
    Map<int, int> ratingCounts = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0};

    for (var rating in ratings) {
      ratingCounts[rating] = (ratingCounts[rating] ?? 0) + 1;
    }

    int totalRatings = ratings.length;

    return Column(
      children: List.generate(5, (index) {
        int star = 5 - index;
        double percentage = totalRatings == 0 ? 0 : (ratingCounts[star]! / totalRatings) * 100;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              const Icon(Icons.star, color: Colors.amber),
              const SizedBox(width: 8),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double maxWidth = constraints.maxWidth;
                    return Stack(
                      children: [
                        Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        Container(
                          height: 8,
                          width: (percentage / 100) * maxWidth,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Text("${ratingCounts[star]}"),
            ],
          ),
        );
      }),
    );
  }
}
