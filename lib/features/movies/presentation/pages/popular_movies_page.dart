import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/common/widgets/custom_app_bar.dart';
import 'package:filmflix/core/common/widgets/error_page.dart';
import 'package:filmflix/core/common/widgets/loading_indicator.dart';
import 'package:filmflix/core/common/widgets/vertical_listview.dart';
import 'package:filmflix/core/common/widgets/vertical_listview_card.dart';
import 'package:filmflix/core/constants/app_strings.dart';
import 'package:filmflix/core/services/service_locator.dart';
import 'package:filmflix/core/utils/enums.dart';
import 'package:filmflix/features/movies/presentation/bloc/popular_movies_bloc/popular_movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesPage extends StatelessWidget {
  const PopularMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<PopularMoviesBloc>()..add(GetPopularMoviesEvent()),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: AppStrings.popularMovies,
        ),
        body: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
          builder: (context, state) {
            switch (state.status) {
              case GetAllRequestStatus.loading:
                return const LoadingIndicator();
              case GetAllRequestStatus.loaded:
                return PopularMoviesWidget(movies: state.movies);
              case GetAllRequestStatus.error:
                return ErrorPage(
                  onTryAgainPressed: () {
                    context
                        .read<PopularMoviesBloc>()
                        .add(GetPopularMoviesEvent());
                  },
                );
              case GetAllRequestStatus.fetchMoreError:
                return PopularMoviesWidget(movies: state.movies);
            }
          },
        ),
      ),
    );
  }
}

class PopularMoviesWidget extends StatelessWidget {
  const PopularMoviesWidget({
    required this.movies,
    super.key,
  });

  final List<Media> movies;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
      builder: (context, state) {
        return VerticalListView(
          itemCount: movies.length + 1,
          itemBuilder: (context, index) {
            if (index < movies.length) {
              return VerticalListViewCard(media: movies[index]);
            } else {
              return const LoadingIndicator();
            }
          },
          addEvent: () {
            context
                .read<PopularMoviesBloc>()
                .add(FetchMorePopularMoviesEvent());
          },
        );
      },
    );
  }
}
