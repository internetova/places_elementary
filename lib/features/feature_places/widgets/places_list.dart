import 'package:flutter/material.dart';
import 'package:places_elementary/assets/strings/app_strings.dart';
import 'package:places_elementary/features/common/constants/app_sizes.dart';
import 'package:places_elementary/features/common/widgets/error/error_state_widget.dart';
import 'package:places_elementary/features/feature_places/domain/entity/place.dart';
import 'package:places_elementary/features/feature_places/widgets/place_card.dart';

/// Виджет списка мест
class PlacesList extends StatelessWidget {
  final List<Place> data;

  const PlacesList({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return data.isNotEmpty
        ? SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    AppSizes.paddingStandard,
                    index == 0 ? 34 : 0,
                    AppSizes.paddingStandard,
                    AppSizes.paddingStandard,
                  ),
                  child: PlaceCard(
                    card: data[index],
                  ),
                );
              },
              childCount: data.length,
            ),
          )
        : const SliverFillRemaining(
            child: ErrorStateWidget(
              header: AppStrings.errorEmptyHeader,
              text: AppStrings.errorEmptyText,
            ),
          );
  }
}