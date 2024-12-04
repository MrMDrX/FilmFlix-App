import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:filmflix/core/constants/app_strings.dart';
import 'package:filmflix/core/constants/app_values.dart';
import 'package:filmflix/core/extensions/context_extension.dart';

class OverviewSection extends StatelessWidget {
  final String overview;

  const OverviewSection({
    super.key,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: ReadMoreText(
        overview,
        trimLines: 5,
        trimMode: TrimMode.Line,
        trimCollapsedText: AppStrings.showMore,
        trimExpandedText: AppStrings.showLess,
        style: textTheme.bodyLarge,
        moreStyle: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
        lessStyle: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
