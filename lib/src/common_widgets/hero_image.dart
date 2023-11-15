import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:practice_food_delivery/src/theme/theme_provider.dart';

class HeroImage extends HookConsumerWidget {
  const HeroImage(this.imageUrl,{
    super.key,
    this.heroTag,
    this.opacity = 1.0,
    this.width,
    this.height,
    this.useGradient = true,
    this.gradientStops,
  });
  final String imageUrl;
  final Object? heroTag;
  final double? opacity;
  final double? height;
  final double? width;
  final bool useGradient;
  final List<double>? gradientStops;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final blendMode = themeMode == ThemeMode.dark ? BlendMode.darken : BlendMode.screen;
    final blendColor = themeMode == ThemeMode.dark ? Colors.black87 : Colors.white;

    return Hero(
      tag: heroTag ?? UniqueKey(),
      child: Opacity(
        opacity: opacity ?? 0.0,
        child: ShaderMask(
          blendMode: blendMode,
          shaderCallback: (rect) => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [useGradient ? blendColor : Colors.transparent, Colors.transparent,],
            stops: gradientStops,
          ).createShader(rect),
          child: Image.asset(imageUrl, fit: BoxFit.cover, height: height, width: width,),
        ),
      ),
    );
  }
}
