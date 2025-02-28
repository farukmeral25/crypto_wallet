import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paribu_mobile/core/constant/theme/app_colors.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.assetPath, this.height, this.width, this.color, this.fit = BoxFit.contain});

  final String assetPath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    if (assetPath.startsWith("http")) {
      if (assetPath.endsWith(".svg")) {
        return SvgPicture.network(
          assetPath,
          colorFilter: ColorFilter.mode(color ?? AppColors.foregroundTertiary, BlendMode.srcIn),
          height: height,
          width: width,
          fit: fit,
          placeholderBuilder: (BuildContext context) => const CircularProgressIndicator.adaptive(),
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        );
      } else {
        return CachedNetworkImage(
          imageUrl: assetPath,
          color: color,
          height: height,
          width: width,
          fit: fit,
          placeholder: (context, url) => const CircularProgressIndicator.adaptive(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        );
      }
    } else {
      if (assetPath.endsWith(".svg")) {
        return SvgPicture.asset(
          assetPath,
          colorFilter: ColorFilter.mode(color ?? AppColors.foregroundTertiary, BlendMode.srcIn),
          height: height,
          width: width,
          fit: fit,
          placeholderBuilder: (BuildContext context) => const CircularProgressIndicator.adaptive(),
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        );
      } else {
        return Image.asset(
          assetPath,
          height: height,
          width: width,
          color: color,
          fit: fit,
          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
        );
      }
    }
  }
}
