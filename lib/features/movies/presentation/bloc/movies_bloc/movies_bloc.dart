import 'dart:async';
import 'package:filmflix/core/common/usecases/usecase.dart';
import 'package:filmflix/core/utils/enums.dart';
import 'package:filmflix/features/movies/domain/usecases/get_movies_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetMoviesUseCase _getMoviesUseCase;

  MoviesBloc(
    this._getMoviesUseCase,
  ) : super(const MoviesState()) {
    on<GetMoviesEvent>(_getMovies);
  }

  Future<void> _getMovies(
      GetMoviesEvent event, Emitter<MoviesState> emit) async {
    emit(
      state.copyWith(
        status: RequestStatus.loading,
      ),
    );
    final result = await _getMoviesUseCase(const NoParams());
    result.fold(
      (l) => emit(
        state.copyWith(
          status: RequestStatus.error,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          status: RequestStatus.loaded,
          movies: r,
        ),
      ),
    );
  }
}
