import 'package:flutter/material.dart';
import 'package:filmflix/core/constants/app_strings.dart';
import 'package:filmflix/core/common/widgets/circle_dot.dart';
import 'package:filmflix/core/extensions/context_extension.dart';
import 'package:filmflix/features/shows/domain/entities/episode.dart';
import 'package:filmflix/features/shows/domain/entities/season.dart';

class TVShowCardDetails extends StatelessWidget {
  const TVShowCardDetails({
    super.key,
    required this.lastEpisode,
    required this.genres,
    required this.seasons,
  });

  final Episode lastEpisode;
  final String genres;
  final List<Season> seasons;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    if (lastEpisode.number != 0 &&
        lastEpisode.season != 0 &&
        genres.isNotEmpty &&
        seasons.isNotEmpty) {
      return Row(
        children: [
          Text(
            'S${lastEpisode.season}E${lastEpisode.number}',
            style: textTheme.bodyLarge,
          ),
          const CircleDot(),
          if (genres.isNotEmpty) ...[
            Text(
              genres,
              style: textTheme.bodyLarge,
            ),
            const CircleDot(),
          ] else ...[
            if (seasons.isNotEmpty) ...[
              const CircleDot(),
            ]
          ],
          Text(
            _getNbOfSeasons(seasons.length),
            style: textTheme.bodyLarge,
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}

String _getNbOfSeasons(int seasons) {
  return '$seasons ${seasons == 1 ? AppStrings.season : AppStrings.seasons}';
}
