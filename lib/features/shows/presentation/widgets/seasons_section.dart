import 'package:filmflix/core/constants/app_values.dart';
import 'package:filmflix/features/shows/domain/entities/season.dart';
import 'package:filmflix/features/shows/presentation/widgets/season_card.dart';
import 'package:flutter/material.dart';

class SeasonsSection extends StatelessWidget {
  const SeasonsSection({
    super.key,
    required this.seasons,
    required this.tmdbId,
  });

  final List<Season> seasons;
  final int tmdbId;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: AppSize.s400),
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        physics: const BouncingScrollPhysics(),
        itemCount: seasons.length,
        itemBuilder: (context, index) => SeasonCard(
          season: seasons[index],
          tvShowId: tmdbId,
        ),
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppSize.s10),
      ),
    );
  }
}
