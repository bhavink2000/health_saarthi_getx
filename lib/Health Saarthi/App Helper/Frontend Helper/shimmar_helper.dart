import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../font_&_color_helper.dart';

class ShimmerHelper extends StatelessWidget {
  final Widget child;
  const ShimmerHelper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorHelper.hsPrime.withOpacity(0.8),
      period: const Duration(seconds: 1),
      highlightColor: ColorHelper.hsPrime,
      child: child,
    );
  }
}
