import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmflix/core/extensions/context_extension.dart';
import 'package:filmflix/core/common/widgets/error_text.dart';
import 'package:filmflix/core/common/widgets/image_with_shimmer.dart';
import 'package:filmflix/core/common/widgets/loading_indicator.dart';
import 'package:filmflix/core/config/themes/app_colors.dart';
import 'package:filmflix/core/constants/app_strings.dart';
import 'package:filmflix/core/constants/app_values.dart';
import 'package:filmflix/core/services/service_locator.dart';
import 'package:filmflix/core/utils/enums.dart';
import 'package:filmflix/core/utils/helpers.dart';
import 'package:filmflix/features/shows/domain/entities/season.dart';
import 'package:filmflix/features/shows/presentation/bloc/show_details_bloc/show_details_bloc.dart';
import 'package:filmflix/features/shows/presentation/widgets/episodes_widget.dart';

class SeasonCard extends StatelessWidget {
  const SeasonCard({
    super.key,
    required this.season,
    required this.tvShowId,
  });

  final Season season;
  final int tvShowId;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return InkWell(
      onTap: () {
        _showBottomSheet(context, tvShowId, season.seasonNumber);
      },
      child: SizedBox(
        width: double.infinity,
        height: AppSize.s160,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: AppPadding.p16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s8),
                child: ImageWithShimmer(
                  imageUrl: season.posterUrl,
                  width: AppSize.s110,
                  height: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    season.name,
                    style: textTheme.bodyMedium,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: AppPadding.p6),
                    child: Text(
                      '${season.episodeCount} ${AppStrings.episodes.toLowerCase()}',
                      style: textTheme.bodyLarge,
                    ),
                  ),
                  if (season.airDate.isNotEmpty) ...[
                    Text(
                      '${AppStrings.airDate} ${season.airDate}',
                      style: textTheme.bodyLarge,
                    ),
                  ],
                  if (season.overview.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.only(top: AppPadding.p4),
                      child: Text(
                        season.overview,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.primaryText,
              size: AppSize.s18,
            )
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(context, id, seasonNumber) {
  showCustomBottomSheet(
    context,
    BlocProvider.value(
      value: sl<TVShowDetailsBloc>()
        ..add(GetSeasonDetailsEvent(id: id, seasonNumber: seasonNumber)),
      child: BlocBuilder<TVShowDetailsBloc, TVShowDetailsState>(
        builder: (context, state) {
          switch (state.seasonDetailsStatus) {
            case RequestStatus.loading:
              return const LoadingIndicator();
            case RequestStatus.loaded:
              return EpisodesWidget(
                episodes: state.seasonDetails!.episodes,
                tmdbId: id.toString(),
              );
            case RequestStatus.error:
              return const ErrorText();
          }
        },
      ),
    ),
  );
}
