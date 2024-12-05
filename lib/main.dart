import 'package:flutter/material.dart';
import 'package:filmflix/core/services/service_locator.dart';
import 'package:filmflix/core/config/routes/app_router.dart';
import 'package:filmflix/core/config/themes/app_themes.dart';
import 'package:filmflix/core/constants/app_strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.init();
  runApp(const MyApp());
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
