import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:filmflix/core/common/widgets/image_with_shimmer.dart';
import 'package:filmflix/core/config/routes/app_routes.dart';
import 'package:filmflix/core/constants/app_values.dart';
import 'package:filmflix/features/search/domain/entities/search_result_item.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({
    super.key,
    required this.item,
  });

  final SearchResultItem item;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            item.isMovie
                ? context.pushNamed(AppRoutes.movieDetailsRoute,
                    pathParameters: {'movieId': item.tmdbId.toString()})
                : context.pushNamed(AppRoutes.tvShowDetailsRoute,
                    pathParameters: {'tvShowId': item.tmdbId.toString()});
          },
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.s8),
              child: ImageWithShimmer(
                imageUrl: item.posterUrl,
                width: double.infinity,
                height: AppSize.s150,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            item.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
