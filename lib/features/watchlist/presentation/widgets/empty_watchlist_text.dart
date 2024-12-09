import 'package:flutter/material.dart';
import 'package:filmflix/core/constants/app_values.dart';
import 'package:filmflix/core/constants/app_strings.dart';
import 'package:filmflix/core/extensions/context_extension.dart';

class EmptyWatchlistText extends StatelessWidget {
  const EmptyWatchlistText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.watchlistIsEmpty,
              style: textTheme.titleMedium,
            ),
            Padding(
              padding: const EdgeInsets.only(top: AppPadding.p6),
              child: Text(
                AppStrings.watchlistText,
                style: textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
