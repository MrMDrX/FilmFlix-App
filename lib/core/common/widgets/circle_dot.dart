import 'package:flutter/material.dart';
import 'package:filmflix/core/config/themes/app_colors.dart';
import 'package:filmflix/core/constants/app_values.dart';

class CircleDot extends StatelessWidget {
  const CircleDot({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p6),
      child: Container(
        width: AppSize.s6,
        height: AppSize.s6,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.circleDot,
        ),
      ),
    );
  }
}
