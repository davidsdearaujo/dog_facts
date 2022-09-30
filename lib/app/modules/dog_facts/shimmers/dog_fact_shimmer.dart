import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DogFactShimmer extends StatelessWidget {
  const DogFactShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
          (index) {
            return Container(
              height: 8,
              width: double.infinity,
              color: Colors.white,
              margin: index.isEven
                  ? null
                  : const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            );
          },
        ),
      ),
    );
  }
}
