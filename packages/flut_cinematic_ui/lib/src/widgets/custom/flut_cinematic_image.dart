import 'package:cached_network_image/cached_network_image.dart';
import 'package:flut_cinematic_ui/flut_cinematic_ui.dart';
import 'package:flutter/material.dart';

class FlutCinematicImage extends StatelessWidget {
  const FlutCinematicImage({
    this.fit = BoxFit.cover,
    this.errorWidget = gap0,
    this.placeholder = const FlutCinematicBaseShimmer(
      child: ColoredBox(color: Palette.dark),
    ),
    this.borderRadius = borderRadiusZero,
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.onTap,
  });
  final String? imageUrl;
  final BoxFit fit;
  final Widget errorWidget;
  final double? width;
  final double? height;
  final Widget placeholder;
  final BorderRadiusGeometry borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return ClipRRect(
        borderRadius: borderRadius,
        child: errorWidget,
      );
    }
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: CachedNetworkImage(
          imageUrl: imageUrl!,
          fit: fit,
          width: width,
          height: height,
          placeholder: (_, __) => placeholder,
          errorWidget: (_, __, ___) => errorWidget,
        ),
      ),
    );
  }
}
