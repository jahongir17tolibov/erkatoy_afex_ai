import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImageView extends StatelessWidget {
  const SvgImageView(
    this.asset, {
    super.key,
    this.width,
    this.height,
    this.color,
  });

  final String asset;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: width,
      height: height,
      fit: (width == null && height == null) ? BoxFit.scaleDown : BoxFit.cover,
      colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
    );
  }
}
