import 'package:filmflix/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:filmflix/core/extensions/context_extension.dart';
import 'package:filmflix/core/common/entities/media.dart';
import 'package:filmflix/core/common/widgets/slider_card_image.dart';
import 'package:filmflix/core/config/themes/app_colors.dart';
import 'package:filmflix/core/constants/app_values.dart';

class SliderCard extends StatelessWidget {
  final Media media;
  final int itemIndex;
  const SliderCard({
    super.key,
    required this.media,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return GestureDetector(
      onTap: () {
        goToDetailsPage(context, media);
      },
      child: SafeArea(
        child: Stack(
          children: [
            SliderCardImage(imageUrl: media.backdropUrl),
            Padding(
              padding: const EdgeInsets.only(
                right: AppPadding.p16,
                left: AppPadding.p16,
                bottom: AppPadding.p10,
              ),
              child: SizedBox(
                height: context.height * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      media.title,
                      maxLines: 2,
                      style: textTheme.titleMedium,
                    ),
                    Text(
                      media.releaseDate,
                      style: textTheme.bodyLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: AppPadding.p4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          AppConstants.carouselSliderItemsCount,
                          (indexDot) {
                            return Container(
                              margin:
                                  const EdgeInsets.only(right: AppMargin.m10),
                              width: indexDot == itemIndex
                                  ? AppSize.s30
                                  : AppSize.s6,
                              height: AppSize.s6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppSize.s6),
                                color: indexDot == itemIndex
                                    ? AppColors.primary
                                    : AppColors.inactive,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
