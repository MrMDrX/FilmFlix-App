import 'package:filmflix/features/settings/presentation/bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:filmflix/core/constants/app_strings.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/services/service_locator.dart';
import 'package:filmflix/core/config/routes/app_router.dart';
import 'package:filmflix/core/config/themes/app_themes.dart';
import 'package:filmflix/features/watchlist/presentation/bloc/watchlist_bloc/watchlist_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MediaAdapter());
  await Hive.openBox(AppStrings.boxName);
  ServiceLocator.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<WatchlistBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<ThemeCubit>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          darkTheme: AppThemes.darkTheme.copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: state.color,
              brightness: state.brightness,
            ),
            useMaterial3: state.useMaterial3,
          ),
          theme: AppThemes.lightTheme.copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: state.color,
              brightness: state.brightness,
            ),
            useMaterial3: state.useMaterial3,
          ),
          themeMode: state.brightness == Brightness.dark
              ? ThemeMode.dark
              : ThemeMode.light,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
