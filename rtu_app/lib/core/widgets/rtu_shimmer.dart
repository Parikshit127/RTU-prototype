import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../theme/theme.dart';

/// Loading placeholder with shimmer animation
/// Drop-in replacement while data is loading
class RTUShimmer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const RTUShimmer({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: RTUColors.divider,
      highlightColor: RTUColors.background,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

/// Pre-built shimmer placeholder for a card-style loading state
class RTUCardShimmer extends StatelessWidget {
  const RTUCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: RTUSpacing.lg,
        vertical: RTUSpacing.sm,
      ),
      child: Shimmer.fromColors(
        baseColor: RTUColors.divider,
        highlightColor: RTUColors.background,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(RTUSpacing.radiusMd),
          ),
        ),
      ),
    );
  }
}

/// Shimmer for a list of items
class RTUListShimmer extends StatelessWidget {
  final int itemCount;

  const RTUListShimmer({super.key, this.itemCount = 5});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        itemCount,
        (index) => const Padding(
          padding: EdgeInsets.only(bottom: RTUSpacing.sm),
          child: RTUCardShimmer(),
        ),
      ),
    );
  }
}
