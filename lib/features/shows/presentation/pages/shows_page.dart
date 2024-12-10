import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:filmflix/core/config/routes/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/common/widgets/custom_slider.dart';
import 'package:filmflix/core/common/widgets/error_page.dart';
import 'package:filmflix/core/common/widgets/loading_indicator.dart';
import 'package:filmflix/core/common/widgets/section_header.dart';
import 'package:filmflix/core/common/widgets/section_listview.dart';
import 'package:filmflix/core/common/widgets/section_listview_card.dart';
import 'package:filmflix/core/common/widgets/slider_card.dart';
import 'package:filmflix/core/constants/app_strings.dart';
import 'package:filmflix/core/constants/app_values.dart';
import 'package:filmflix/core/services/service_locator.dart';
import 'package:filmflix/core/utils/enums.dart';
import 'package:filmflix/features/shows/presentation/bloc/shows_bloc/shows_bloc.dart';

class TVShowsPage extends StatelessWidget {
  const TVShowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TVShowsBloc>()..add(GetTVShowsEvent()),
      child: Scaffold(
        body: BlocBuilder<TVShowsBloc, TVShowsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const LoadingIndicator();
              case RequestStatus.loaded:
                return TVShowsWidget(
                  onAirTvShows: state.tvShows[0],
                  popularTvShows: state.tvShows[1],
                  topRatedTvShows: state.tvShows[2],
                );
              case RequestStatus.error:
                return ErrorPage(
                  onTryAgainPressed: () {
                    context.read<TVShowsBloc>().add(GetTVShowsEvent());
                  },
                );
            }
          },
        ),
      ),
    );
  }
}

class TVShowsWidget extends StatelessWidget {
  const TVShowsWidget({
    super.key,
    required this.onAirTvShows,
    required this.popularTvShows,
    required this.topRatedTvShows,
  });

  final List<Media> onAirTvShows;
  final List<Media> popularTvShows;
  final List<Media> topRatedTvShows;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Stack(
            children: [
              CustomSlider(
                itemBuilder: (context, itemIndex, _) {
                  return SliderCard(
                    media: onAirTvShows[itemIndex],
                    itemIndex: itemIndex,
                  );
                },
              ),
              // app logo
              Positioned(
                top: AppSize.s60,
                left: AppSize.s16,
                child: Image.asset(
                  AppAssets.appLogo,
                  fit: BoxFit.contain,
                  width: AppSize.s100,
                ),
              ),
            ],
          ),
          SectionHeader(
            title: AppStrings.popularShows,
            onSeeAllTap: () {
              context.goNamed(AppRoutes.popularTvShowsRoute);
            },
          ),
          SectionListView(
            height: AppSize.s240,
            itemCount: popularTvShows.length,
            itemBuilder: (context, index) {
              return SectionListViewCard(media: popularTvShows[index]);
            },
          ),
          SectionHeader(
            title: AppStrings.topRatedShows,
            onSeeAllTap: () {
              context.goNamed(AppRoutes.topRatedTvShowsRoute);
            },
          ),
          SectionListView(
            height: AppSize.s240,
            itemCount: topRatedTvShows.length,
            itemBuilder: (context, index) {
              return SectionListViewCard(media: topRatedTvShows[index]);
            },
          ),
        ],
      ),
    );
  }
}
