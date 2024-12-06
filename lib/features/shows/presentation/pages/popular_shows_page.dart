import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmflix/core/utils/enums.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/common/widgets/custom_app_bar.dart';
import 'package:filmflix/core/common/widgets/error_page.dart';
import 'package:filmflix/core/common/widgets/loading_indicator.dart';
import 'package:filmflix/core/common/widgets/vertical_listview.dart';
import 'package:filmflix/core/common/widgets/vertical_listview_card.dart';
import 'package:filmflix/core/constants/app_strings.dart';
import 'package:filmflix/core/services/service_locator.dart';
import 'package:filmflix/features/shows/presentation/bloc/popular_shows_bloc/popular_shows_bloc.dart';

class PopularTVShowsPage extends StatelessWidget {
  const PopularTVShowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<PopularTVShowsBloc>()..add(GetPopularTVShowsEvent()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.popularShows,
        ),
        body: BlocBuilder<PopularTVShowsBloc, PopularTVShowsState>(
          builder: (context, state) {
            switch (state.status) {
              case GetAllRequestStatus.loading:
                return const LoadingIndicator();
              case GetAllRequestStatus.loaded:
                return PopularTVShowsWidget(tvShows: state.tvShows);
              case GetAllRequestStatus.error:
                return ErrorPage(
                  onTryAgainPressed: () {
                    context
                        .read<PopularTVShowsBloc>()
                        .add(GetPopularTVShowsEvent());
                  },
                );
              case GetAllRequestStatus.fetchMoreError:
                return PopularTVShowsWidget(tvShows: state.tvShows);
            }
          },
        ),
      ),
    );
  }
}

class PopularTVShowsWidget extends StatelessWidget {
  const PopularTVShowsWidget({
    super.key,
    required this.tvShows,
  });

  final List<Media> tvShows;

  @override
  Widget build(BuildContext context) {
    return VerticalListView(
      itemCount: tvShows.length + 1,
      itemBuilder: (context, index) {
        if (index < tvShows.length) {
          return VerticalListViewCard(media: tvShows[index]);
        } else {
          return const LoadingIndicator();
        }
      },
      addEvent: () {
        context.read<PopularTVShowsBloc>().add(FetchMorePopularTVShowsEvent());
      },
    );
  }
}
