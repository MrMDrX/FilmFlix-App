import 'package:flutter/material.dart';
import 'package:filmflix/core/constants/app_values.dart';
import 'package:filmflix/core/extensions/context_extension.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: AppPadding.p16,
        left: AppPadding.p16,
        top: AppPadding.p8,
        bottom: AppPadding.p4,
      ),
      child: Text(
        title,
        style: context.textTheme.titleSmall,
      ),
    );
  }
}
