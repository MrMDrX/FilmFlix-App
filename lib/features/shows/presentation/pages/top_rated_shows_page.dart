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
import 'package:filmflix/features/shows/presentation/bloc/top_rated_shows_bloc/top_rated_shows_bloc.dart';

class TopRatedTVShowsPage extends StatelessWidget {
  const TopRatedTVShowsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<TopRatedTVShowsBloc>()..add(GetTopRatedTVShowsEvent()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.topRatedShows,
        ),
        body: BlocBuilder<TopRatedTVShowsBloc, TopRatedTVShowsState>(
          builder: (context, state) {
            switch (state.status) {
              case GetAllRequestStatus.loading:
                return const LoadingIndicator();
              case GetAllRequestStatus.loaded:
                return TopRatedTVShowsWidget(tvShows: state.tvShows);
              case GetAllRequestStatus.error:
                return ErrorPage(
                  onTryAgainPressed: () {
                    context
                        .read<TopRatedTVShowsBloc>()
                        .add(GetTopRatedTVShowsEvent());
                  },
                );
              case GetAllRequestStatus.fetchMoreError:
                return TopRatedTVShowsWidget(tvShows: state.tvShows);
            }
          },
        ),
      ),
    );
  }
}

class TopRatedTVShowsWidget extends StatelessWidget {
  const TopRatedTVShowsWidget({
    super.key,
    required this.tvShows,
  });

  final List<Media> tvShows;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerticalListView(
        itemCount: tvShows.length + 1,
        itemBuilder: (context, index) {
          if (index < tvShows.length) {
            return VerticalListViewCard(media: tvShows[index]);
          } else {
            return const LoadingIndicator();
          }
        },
        addEvent: () {
          context
              .read<TopRatedTVShowsBloc>()
              .add(FetchMoreTopRatedTVShowsEvent());
        },
      ),
    );
  }
}
