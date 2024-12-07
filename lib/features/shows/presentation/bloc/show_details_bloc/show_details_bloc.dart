import 'dart:async';
import 'package:filmflix/core/common/entities/media_details.dart';
import 'package:filmflix/features/shows/domain/entities/season_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:filmflix/core/utils/enums.dart';
import 'package:filmflix/features/shows/domain/usecases/get_season_details_usecase.dart';
import 'package:filmflix/features/shows/domain/usecases/get_show_details_usecase.dart';

part 'show_details_event.dart';
part 'show_details_state.dart';

class TVShowDetailsBloc extends Bloc<TVShowDetailsEvent, TVShowDetailsState> {
  TVShowDetailsBloc(
    this._getTvShowDetailsUseCase,
    this._getSeasonDetailsUseCase,
  ) : super(const TVShowDetailsState()) {
    on<GetTVShowDetailsEvent>(_getTvShowDetails);
    on<GetSeasonDetailsEvent>(_getSeasonDetails);
  }

  final GetTVShowDetailsUseCase _getTvShowDetailsUseCase;
  final GetSeasonDetailsUseCase _getSeasonDetailsUseCase;

  Future<void> _getTvShowDetails(
      GetTVShowDetailsEvent event, Emitter<TVShowDetailsState> emit) async {
    emit(
      state.copyWith(
        tvShowDetailsStatus: RequestStatus.loading,
      ),
    );
    final result = await _getTvShowDetailsUseCase(event.id);
    result.fold(
      (l) => emit(
        TVShowDetailsState(
          tvShowDetailsStatus: RequestStatus.error,
          tvShowDetailsMessage: l.message,
        ),
      ),
      (r) => emit(
        TVShowDetailsState(
          tvShowDetailsStatus: RequestStatus.loaded,
          tvShowDetails: r,
        ),
      ),
    );
  }

  Future<void> _getSeasonDetails(
      GetSeasonDetailsEvent event, Emitter<TVShowDetailsState> emit) async {
    emit(
      state.copyWith(
        seasonDetailsStatus: RequestStatus.loading,
      ),
    );
    final result = await _getSeasonDetailsUseCase(
      SeasonDetailsParams(
        id: event.id,
        seasonNumber: event.seasonNumber,
      ),
    );
    result.fold(
      (l) => emit(
        state.copyWith(
          seasonDetailsStatus: RequestStatus.error,
          seasonDetailsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          seasonDetailsStatus: RequestStatus.loaded,
          seasonDetails: r,
        ),
      ),
    );
  }
}