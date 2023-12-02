/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/burger.webp
  AssetGenImage get burger => const AssetGenImage('assets/images/burger.webp');

  /// File path: assets/images/burrito.webp
  AssetGenImage get burrito =>
      const AssetGenImage('assets/images/burrito.webp');

  /// File path: assets/images/pancakes.webp
  AssetGenImage get pancakes =>
      const AssetGenImage('assets/images/pancakes.webp');

  /// File path: assets/images/pasta.webp
  AssetGenImage get pasta => const AssetGenImage('assets/images/pasta.webp');

  /// File path: assets/images/pizza.webp
  AssetGenImage get pizza => const AssetGenImage('assets/images/pizza.webp');

  /// File path: assets/images/ramen.webp
  AssetGenImage get ramen => const AssetGenImage('assets/images/ramen.webp');

  /// File path: assets/images/restaurant0.webp
  AssetGenImage get restaurant0 =>
      const AssetGenImage('assets/images/restaurant0.webp');

  /// File path: assets/images/restaurant1.webp
  AssetGenImage get restaurant1 =>
      const AssetGenImage('assets/images/restaurant1.webp');

  /// File path: assets/images/restaurant2.webp
  AssetGenImage get restaurant2 =>
      const AssetGenImage('assets/images/restaurant2.webp');

  /// File path: assets/images/restaurant3.webp
  AssetGenImage get restaurant3 =>
      const AssetGenImage('assets/images/restaurant3.webp');

  /// File path: assets/images/restaurant4.webp
  AssetGenImage get restaurant4 =>
      const AssetGenImage('assets/images/restaurant4.webp');

  /// File path: assets/images/salmon.webp
  AssetGenImage get salmon => const AssetGenImage('assets/images/salmon.webp');

  /// File path: assets/images/steak.webp
  AssetGenImage get steak => const AssetGenImage('assets/images/steak.webp');

  /// List of all assets
  List<AssetGenImage> get values => [
        burger,
        burrito,
        pancakes,
        pasta,
        pizza,
        ramen,
        restaurant0,
        restaurant1,
        restaurant2,
        restaurant3,
        restaurant4,
        salmon,
        steak
      ];
}

class $AssetsJsonsGen {
  const $AssetsJsonsGen();

  /// File path: assets/jsons/cart.json
  String get cart => 'assets/jsons/cart.json';

  /// File path: assets/jsons/favorite.json
  String get favorite => 'assets/jsons/favorite.json';

  /// File path: assets/jsons/plus.json
  String get plus => 'assets/jsons/plus.json';

  /// File path: assets/jsons/trash.json
  String get trash => 'assets/jsons/trash.json';

  /// List of all assets
  List<String> get values => [cart, favorite, plus, trash];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonsGen jsons = $AssetsJsonsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
