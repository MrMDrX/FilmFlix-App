import 'package:flutter/material.dart';
import 'package:filmflix/core/utils/helpers.dart';
import 'package:filmflix/core/constants/app_values.dart';
import 'package:filmflix/core/constants/app_strings.dart';
import 'package:filmflix/core/config/themes/app_colors.dart';
import 'package:filmflix/core/extensions/context_extension.dart';
import 'package:filmflix/features/shows/domain/entities/episode.dart';
import 'package:filmflix/features/shows/presentation/widgets/episode_card.dart';

class EpisodesWidget extends StatelessWidget {
  const EpisodesWidget({
    super.key,
    required this.episodes,
    required this.tmdbId,
  });

  final List<Episode> episodes;
  final String tmdbId;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return SizedBox(
      height: AppSize.s400,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: AppPadding.p8,
              top: AppPadding.p6,
            ),
            child: Text(
              AppStrings.episodes,
              style: textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: AppPadding.p8),
              physics: const BouncingScrollPhysics(),
              itemCount: episodes.length,
              itemBuilder: (context, index) => Stack(
                children: [
                  EpisodeCard(episode: episodes[index]),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: InkWell(
                      onTap: () {
                        goToPlayerPage(
                          context: context,
                          tmdbId: tmdbId,
                          season: episodes[index].season.toString(),
                          episode: index.toString(),
                        );
                      },
                      child: Container(
                        height: AppSize.s40,
                        width: AppSize.s40,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppSize.s10),
            ),
          ),
        ],
      ),
    );
  }
}
