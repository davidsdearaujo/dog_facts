import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class RefreshButtonShimmer extends StatelessWidget {
  const RefreshButtonShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      shape: const CircleBorder(),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Theme.of(context).disabledColor,
          shape: BoxShape.circle,
        ),
        child: LoadingAnimationWidget.horizontalRotatingDots(
          color: Colors.white,
          size: 20,
        ),
      ),
    );
  }
}
