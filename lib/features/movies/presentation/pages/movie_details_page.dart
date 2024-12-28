import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmflix/core/common/entities/media_details.dart';
import 'package:filmflix/core/common/widgets/details_card.dart';
import 'package:filmflix/core/common/widgets/error_page.dart';
import 'package:filmflix/core/common/widgets/loading_indicator.dart';
import 'package:filmflix/core/common/widgets/section_listview.dart';
import 'package:filmflix/core/common/widgets/section_title.dart';
import 'package:filmflix/core/constants/app_strings.dart';
import 'package:filmflix/core/constants/app_values.dart';
import 'package:filmflix/core/services/service_locator.dart';
import 'package:filmflix/core/utils/enums.dart';
import 'package:filmflix/core/utils/helpers.dart';
import 'package:filmflix/features/movies/domain/entities/cast.dart';
import 'package:filmflix/features/movies/domain/entities/review.dart';
import 'package:filmflix/features/movies/presentation/bloc/movie_details_bloc/movie_details_bloc.dart';
import 'package:filmflix/features/movies/presentation/widgets/cast_card.dart';
import 'package:filmflix/features/movies/presentation/widgets/movie_card_details.dart';
import 'package:filmflix/features/movies/presentation/widgets/review_card.dart';
import 'package:filmflix/core/config/themes/app_colors.dart';

class MovieDetailsPage extends StatelessWidget {
  final int movieId;

  const MovieDetailsPage({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<MovieDetailsBloc>()..add(GetMovieDetailsEvent(movieId)),
      child: Scaffold(
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            switch (state.status) {
              case RequestStatus.loading:
                return const LoadingIndicator();
              case RequestStatus.loaded:
                return MovieDetailsWidget(movieDetails: state.movieDetails!);
              case RequestStatus.error:
                return ErrorPage(
                  onTryAgainPressed: () {
                    context
                        .read<MovieDetailsBloc>()
                        .add(GetMovieDetailsEvent(movieId));
                  },
                );
            }
          },
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            if (state.status == RequestStatus.loaded) {
              return FloatingActionButton(
                onPressed: () {
                  goToPlayerPage(
                    context: context,
                    tmdbId: state.movieDetails!.tmdbId.toString(),
                  );
                },
                backgroundColor: AppColors.primary,
                tooltip: AppStrings.watch,
                child: const Icon(Icons.play_arrow_rounded),
              );
            } else {
              // Return an empty container if the state is not loaded
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({
    required this.movieDetails,
    super.key,
  });

  final MediaDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DetailsCard(
            mediaDetails: movieDetails,
            detailsWidget: MovieCardDetails(movieDetails: movieDetails),
          ),
          getOverviewSection(movieDetails.overview),
          _getCast(movieDetails.cast),
          _getReviews(movieDetails.reviews),
          getSimilarSection(movieDetails.similar),
          const SizedBox(height: AppSize.s8),
        ],
      ),
    );
  }
}

Widget _getCast(List<Cast>? cast) {
  if (cast != null && cast.isNotEmpty) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: AppStrings.cast),
        SectionListView(
          height: AppSize.s175,
          itemCount: cast.length,
          itemBuilder: (context, index) => CastCard(
            cast: cast[index],
          ),
        ),
      ],
    );
  } else {
    return const SizedBox();
  }
}

Widget _getReviews(List<Review>? reviews) {
  if (reviews != null && reviews.isNotEmpty) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: AppStrings.reviews),
        SectionListView(
          height: AppSize.s175,
          itemCount: reviews.length,
          itemBuilder: (context, index) => ReviewCard(
            review: reviews[index],
          ),
        ),
      ],
    );
  } else {
    return const SizedBox();
  }
}
