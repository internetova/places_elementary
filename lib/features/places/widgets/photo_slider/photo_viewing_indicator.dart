import 'package:flutter/material.dart';
import 'package:places_elementary/util/typedefs.dart';

/// индикатор просмотра фотографий
class PhotoViewingIndicator extends StatelessWidget {
  final List<String> data;
  final DataValueChanged<int, Color> getColorIndicator;

  const PhotoViewingIndicator({
    Key? key,
    required this.data,
    required this.getColorIndicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: data
          .asMap()
          .map(
            (i, element) => MapEntry(
              i,
              Expanded(
                child: Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: getColorIndicator(i),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
