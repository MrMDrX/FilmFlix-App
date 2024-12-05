import 'dart:async';

import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/common/usecases/usecase.dart';
import 'package:filmflix/core/utils/enums.dart';
import 'package:filmflix/features/shows/domain/usecases/get_shows_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'shows_event.dart';
part 'shows_state.dart';

class TVShowsBloc extends Bloc<TVShowsEvent, TVShowsState> {
  TVShowsBloc(this._getTvShowsUseCase) : super(const TVShowsState()) {
    on<GetTVShowsEvent>(_getTvShows);
  }

  final GetTVShowsUseCase _getTvShowsUseCase;

  Future<void> _getTvShows(
      TVShowsEvent event, Emitter<TVShowsState> emit) async {
    emit(
      const TVShowsState(
        status: RequestStatus.loading,
      ),
    );
    final result = await _getTvShowsUseCase(const NoParams());
    result.fold(
      (l) => emit(
        const TVShowsState(
          status: RequestStatus.error,
        ),
      ),
      (r) => emit(
        TVShowsState(
          status: RequestStatus.loaded,
          tvShows: r,
        ),
      ),
    );
  }
}
