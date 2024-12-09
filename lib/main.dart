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
  await Hive.openBox('items');
  ServiceLocator.init();
  runApp(BlocProvider(
    create: (context) => sl<WatchlistBloc>(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      routerConfig: AppRouter.router,
    );
  }
}
