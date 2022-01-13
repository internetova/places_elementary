import 'package:flutter/material.dart';
import 'package:places_elementary/features/common/constants/app_default_values.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/placeholder/skeleton.dart';
import 'package:places_elementary/features/places/widgets/places_appbar.dart';

/// Виджет списка мест для состояния загрузки
class PlacesLoader extends StatelessWidget {
  final bool isLoading;

  const PlacesLoader({
    Key? key,
    this.isLoading = AppDefaultValues.shimmerIsLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PlacesAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppSizes.paddingStandard,
          AppSizes.paddingStandard * 2,
          AppSizes.paddingStandard,
          AppSizes.paddingStandard,
        ),
        child: ListView(
          children: List.generate(
            3,
            (index) => _Card(isLoading: isLoading),
          ),
        ),
      ),
    );
  }
}

/// Карточка плейсхолдер
class _Card extends StatelessWidget {
  final bool isLoading;

  const _Card({
    Key? key,
    this.isLoading = AppDefaultValues.shimmerIsLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Material(
          borderRadius: BorderRadius.circular(AppSizes.radiusCard),
          clipBehavior: Clip.antiAlias,
          color: Theme.of(context).primaryColorLight,
          child: Column(
            children: [
              Stack(
                children: [
                  Skeleton(
                    isLoading: isLoading,
                    width: double.infinity,
                    height: 96,
                    borderRadius: BorderRadius.zero,
                    background: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                    shimmerColor: Theme.of(context).primaryColorDark,
                  ),
                  Positioned(
                    top: 8,
                    left: 16,
                    right: 12,
                    child: Row(
                      children: [
                        Skeleton(
                          isLoading: isLoading,
                          width: 100,
                          height: 16,
                          background: Theme.of(context).primaryColor,
                          shimmerColor: Theme.of(context).primaryColorDark,
                        ),
                        const Spacer(),
                        Skeleton(
                          isLoading: isLoading,
                          width: 32,
                          height: 32,
                          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                          background: Theme.of(context).primaryColor,
                          shimmerColor: Theme.of(context).primaryColorDark,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Skeleton(
                      isLoading: isLoading,
                      width: double.infinity,
                      height: 16,
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      background: Theme.of(context).primaryColor,
                      shimmerColor: Theme.of(context).primaryColorDark,
                    ),
                    const SizedBox(height: 8),
                    Skeleton(
                      isLoading: isLoading,
                      width: 230,
                      height: 16,
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      background: Theme.of(context).primaryColor,
                      shimmerColor: Theme.of(context).primaryColorDark,
                    ),
                    const SizedBox(height: 16),
                    Skeleton(
                      isLoading: isLoading,
                      width: 150,
                      height: 16,
                      borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                      background: Theme.of(context).primaryColor,
                      shimmerColor: Theme.of(context).primaryColorDark,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
