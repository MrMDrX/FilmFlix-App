import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:filmflix/core/common/entities/media_details.dart';
import 'package:filmflix/core/utils/enums.dart';
import 'package:filmflix/features/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMoviesDetailsUseCase _getMoviesDetailsUseCase;

  MovieDetailsBloc(this._getMoviesDetailsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }

  Future<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );
    final result = await _getMoviesDetailsUseCase(event.id);
    result.fold(
      (l) => emit(
        state.copyWith(
          status: RequestStatus.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          movieDetails: r,
        ),
      ),
    );
  }
}