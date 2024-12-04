import 'package:flutter/material.dart';
import 'package:filmflix/core/extensions/context_extension.dart';
import 'package:filmflix/core/common/widgets/image_with_shimmer.dart';
import 'package:filmflix/core/config/themes/app_colors.dart';

class SliderCardImage extends StatelessWidget {
  const SliderCardImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.black,
            AppColors.black,
            AppColors.transparent,
          ],
          stops: [0.3, 0.5, 1],
        ).createShader(
          Rect.fromLTRB(0, 0, rect.width, rect.height),
        );
      },
      child: ImageWithShimmer(
        height: context.height * 0.6,
        width: double.infinity,
        imageUrl: imageUrl,
      ),
    );
  }
}
