import 'package:flutter/material.dart';
import 'package:filmflix/core/extensions/context_extension.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:filmflix/core/constants/app_values.dart';

class CustomSlider extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    int itemIndex,
    int,
  ) itemBuilder;
  const CustomSlider({
    required this.itemBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: AppConstants.carouselSliderItemsCount,
      options: CarouselOptions(
        viewportFraction: 1,
        height: context.height * 0.55,
        autoPlay: true,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
