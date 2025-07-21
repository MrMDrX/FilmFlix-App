import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:filmflix/core/config/routes/app_router.dart';
import 'package:filmflix/core/config/routes/app_routes.dart';
import 'package:filmflix/core/constants/app_strings.dart';
import 'package:filmflix/core/constants/app_values.dart';
import 'package:hugeicons/hugeicons.dart';

class MainPage extends StatefulWidget {
  final Widget child;
  final bool showBottomNav;
  const MainPage({
    super.key,
    required this.child,
    this.showBottomNav = true,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: true,
        onPopInvokedWithResult: (bool didPop, Object? result) async {
          if (didPop) {
            final String location = GoRouterState.of(context).uri.toString();
            if (!location.startsWith(moviesPath)) {
              _onItemTapped(0, context);
            }
          }
        },
        child: widget.child,
      ),
      bottomNavigationBar: widget.showBottomNav
          ? BottomNavigationBar(
              backgroundColor:
                  Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: Theme.of(context).colorScheme.secondary,
              items: const [
                BottomNavigationBarItem(
                  label: AppStrings.movies,
                  icon: Icon(
                    HugeIcons.strokeRoundedFilm02,
                    size: AppSize.s20,
                  ),
                ),
                BottomNavigationBarItem(
                  label: AppStrings.shows,
                  icon: Icon(
                    HugeIcons.strokeRoundedTv01,
                    size: AppSize.s20,
                  ),
                ),
                BottomNavigationBarItem(
                  label: AppStrings.search,
                  icon: Icon(
                    HugeIcons.strokeRoundedSearch01,
                    size: AppSize.s20,
                  ),
                ),
                BottomNavigationBarItem(
                  label: AppStrings.watchlist,
                  icon: Icon(
                    HugeIcons.strokeRoundedBookmark02,
                    size: AppSize.s20,
                  ),
                ),
                BottomNavigationBarItem(
                  label: AppStrings.settings,
                  icon: Icon(
                    HugeIcons.strokeRoundedSettings03,
                    size: AppSize.s20,
                  ),
                ),
              ],
              currentIndex: _getSelectedIndex(context),
              onTap: (index) => _onItemTapped(index, context),
            )
          : null,
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith(moviesPath)) {
      return 0;
    }
    if (location.startsWith(tvShowsPath)) {
      return 1;
    }
    if (location.startsWith(searchPath)) {
      return 2;
    }
    if (location.startsWith(watchlistPath)) {
      return 3;
    }
    if (location.startsWith(settingsPath)) {
      return 4;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(AppRoutes.moviesRoute);
        break;
      case 1:
        context.goNamed(AppRoutes.tvShowsRoute);
        break;
      case 2:
        context.goNamed(AppRoutes.searchRoute);
        break;
      case 3:
        context.goNamed(AppRoutes.watchlistRoute);
        break;
      case 4:
        context.goNamed(AppRoutes.settingsRoute);
        break;
    }
  }
}
