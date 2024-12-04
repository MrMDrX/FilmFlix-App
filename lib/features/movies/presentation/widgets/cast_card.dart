import 'package:flutter/material.dart';
import 'package:filmflix/core/common/widgets/image_with_shimmer.dart';
import 'package:filmflix/core/constants/app_values.dart';
import 'package:filmflix/core/extensions/context_extension.dart';
import 'package:filmflix/features/movies/domain/entities/cast.dart';

class CastCard extends StatelessWidget {
  final Cast cast;
  const CastCard({
    required this.cast,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return SizedBox(
      width: AppSize.s100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s8),
            child: ImageWithShimmer(
              imageUrl: cast.profileUrl,
              width: double.infinity,
              height: AppSize.s130,
            ),
          ),
          Text(
            cast.name,
            style: textTheme.bodyLarge,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
