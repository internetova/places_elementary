import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Виджет-скелетон
/// [isLoading] - имеет состояние загрузки (шиммер)
class Skeleton extends StatelessWidget {
  final bool isLoading;
  final double? width;
  final double height;
  final Color background;
  final Color shimmerColor;
  final double radius;
  final BorderRadius? borderRadius;

  const Skeleton({
    Key? key,
    bool? isLoading,
    this.width,
    double? height,
    Color? background,
    Color? shimmerColor,
    double? radius,
    this.borderRadius,
  })  : height = height ?? 16.0,
        radius = radius ?? 16.0,
        background = background ?? Colors.white70,
        shimmerColor = shimmerColor ?? Colors.white,
        isLoading = isLoading ?? false,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Shimmer.fromColors(
            baseColor: background,
            highlightColor: shimmerColor,
            child: _BuildBody(
              width: width,
              height: height,
              background: background,
              borderRadius: borderRadius ?? BorderRadius.circular(radius),
            ),
          )
        : _BuildBody(
            width: width,
            height: height,
            background: background,
            borderRadius: borderRadius ?? BorderRadius.circular(radius),
          );
  }
}

class _BuildBody extends StatelessWidget {
  final double? width;
  final double height;
  final Color background;
  final BorderRadius? borderRadius;

  const _BuildBody({
    Key? key,
    required this.width,
    required this.height,
    required this.background,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: background,
        borderRadius: borderRadius,
      ),
    );
  }
}
