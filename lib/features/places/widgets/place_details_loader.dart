import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places_elementary/assets/colors/colors.dart';
import 'package:places_elementary/assets/res/app_assets.dart';
import 'package:places_elementary/features/common/constants/app_default_values.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/placeholder/skeleton.dart';

/// Состояние загрузки при загрузке места
class PlaceDetailsLoader extends StatelessWidget {
  final bool isLoading;

  const PlaceDetailsLoader({
    Key? key,
    this.isLoading = AppDefaultValues.shimmerIsLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  height: 360,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary.withOpacity(0.1),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: SvgPicture.asset(
                      AppAssets.icPhoto,
                      width: 140,
                      color: AppColors.colorInactiveBlack.withOpacity(0.2),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: 50,
                    height: 8,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: AppSizes.paddingStandard,
                  child: SizedBox(
                    width: 32,
                    height: 32,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(AppSizes.radiusButtonSmall),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 45),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingStandard),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton(
                    isLoading: isLoading,
                    width: 160,
                    height: 20,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    background: theme.colorScheme.secondary.withOpacity(0.1),
                  ),
                  const SizedBox(height: 24),
                  Skeleton(
                    isLoading: isLoading,
                    width: double.infinity,
                    height: 16,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    background: theme.colorScheme.secondary.withOpacity(0.1),
                  ),
                  const SizedBox(height: 8),
                  Skeleton(
                    isLoading: isLoading,
                    width: 230,
                    height: 16,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    background: theme.colorScheme.secondary.withOpacity(0.1),
                  ),
                  const SizedBox(height: 8),
                  Skeleton(
                    isLoading: isLoading,
                    width: 296,
                    height: 16,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    background: theme.colorScheme.secondary.withOpacity(0.1),
                  ),
                  const SizedBox(height: 8),
                  Skeleton(
                    isLoading: isLoading,
                    width: 296,
                    height: 16,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    background: theme.colorScheme.secondary.withOpacity(0.1),
                  ),
                  const SizedBox(height: 32),
                  Skeleton(
                    isLoading: isLoading,
                    width: 156,
                    height: 16,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    background: theme.colorScheme.secondary.withOpacity(0.1),
                  ),
                  const SizedBox(height: 8),
                  Skeleton(
                    isLoading: isLoading,
                    width: double.infinity,
                    height: 16,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    background: theme.colorScheme.secondary.withOpacity(0.1),
                  ),
                  const SizedBox(height: 8),
                  Skeleton(
                    isLoading: isLoading,
                    width: 230,
                    height: 16,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    background: theme.colorScheme.secondary.withOpacity(0.1),
                  ),
                  const SizedBox(height: 8),
                  Skeleton(
                    isLoading: isLoading,
                    width: 296,
                    height: 16,
                    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                    background: theme.colorScheme.secondary.withOpacity(0.1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
