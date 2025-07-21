import 'package:equatable/equatable.dart';
import 'package:filmflix/core/config/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmflix/features/settings/domain/repository/theme_storage.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          const ThemeState(
            brightness:
                Brightness.light, // Default value, will be updated once fetched
            color: AppColors
                .primary, // Default value, will be updated once fetched
            useMaterial3: true, // Default value, will be updated once fetched
          ),
        ) {
    _initializeTheme();
  }

  // Initialize the theme settings by fetching them from SharedPreferences
  Future<void> _initializeTheme() async {
    final brightness = await ThemeStorage.getBrightness();
    final color = await ThemeStorage.getColor();
    final useMaterial3 = await ThemeStorage.getUseMaterial3();
    emit(state.copyWith(
        brightness: brightness, color: color, useMaterial3: useMaterial3));
  }

  Future<void> changeBrightness(Brightness brightness) async {
    await ThemeStorage.setBrightness(brightness);
    emit(state.copyWith(brightness: brightness));
  }

  Future<void> changeUseMaterial3(bool useMaterial3) async {
    await ThemeStorage.setUseMaterial3(useMaterial3);
    emit(state.copyWith(useMaterial3: useMaterial3));
  }

  Future<void> changeColor(Color color) async {
    await ThemeStorage.setColor(color);
    emit(state.copyWith(color: color));
  }
}



/* import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmflix/features/settings/domain/repository/theme_storage.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(
          ThemeState(
            brightness: ThemeStorage.getBrightness(),
            color: ThemeStorage.getColor(),
            useMaterial3: ThemeStorage.getUseMaterial3(),
          ),
        );

  Future<void> changeBrightness(Brightness brightness) async {
    await ThemeStorage.setBrightness(brightness);
    emit(state.copyWith(brightness: brightness));
  }

  Future<void> changeUseMaterial3(bool useMaterial3) async {
    await ThemeStorage.setUseMaterial3(useMaterial3);
    emit(state.copyWith(useMaterial3: useMaterial3));
  }

  Future<void> changeColor(Color color) async {
    await ThemeStorage.setColor(color);
    emit(state.copyWith(color: color));
  }
}
 */