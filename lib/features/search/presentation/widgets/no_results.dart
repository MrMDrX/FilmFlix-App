import 'package:flutter/material.dart';
import 'package:filmflix/core/constants/app_strings.dart';
import 'package:filmflix/core/extensions/context_extension.dart';

class NoResults extends StatelessWidget {
  const NoResults({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          AppStrings.noResults,
          style: context.textTheme.bodyLarge,
        ),
      ),
    );
  }
}
