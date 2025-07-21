import 'package:filmflix/core/common/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:filmflix/core/utils/helpers.dart';
import 'package:filmflix/core/constants/app_values.dart';
import 'package:filmflix/core/constants/app_strings.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.about),
      body: ListView(
        padding: const EdgeInsets.all(AppPadding.p14),
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: AppSize.s15),
          ListTile(
            leading: Image.asset(
              AppAssets.appLogo,
              fit: BoxFit.contain,
              width: AppSize.s100,
            ),
            title: const Text(
                "${AppStrings.appName} ${AppStrings.appVerTxt} ${AppStrings.appVersion}"),
            subtitle: const Text(AppStrings.appDesc),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.handshake),
            title: Text(AppStrings.appPray),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person_2_rounded),
            title: const Text(AppStrings.appDev),
            onTap: () {
              openURL(AppStrings.website);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.open_in_browser_rounded),
            title: const Text(AppStrings.sourceCode),
            onTap: () {
              openURL(AppStrings.repoLink);
            },
          ),
        ],
      ),
    );
  }
}
