import 'package:filmflix/core/common/widgets/custom_app_bar.dart';
import 'package:filmflix/core/config/routes/app_routes.dart';
import 'package:filmflix/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.settings),
      body: Column(
        children: [
          // Theme settings
          ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text('Theme'),
              onTap: () {
                context.pushNamed(AppRoutes.themeRoute);
              }),
          ListTile(
            leading: const Icon(Icons.info_rounded),
            title: const Text('About'),
            onTap: () {
              context.pushNamed(AppRoutes.aboutRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_rounded),
            title: const Text('Privacy Policy'),
            onTap: () {
              // Handle privacy policy navigation
            },
          ),
          ListTile(
            leading: const Icon(Icons.policy_rounded),
            title: const Text('Terms of Service'),
            onTap: () {
              // Handle terms of service navigation
            },
          ),
        ],
      ),
    );
  }
}
