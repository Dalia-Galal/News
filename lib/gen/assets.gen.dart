// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Search.svg
  String get search => 'assets/icons/Search.svg';

  /// File path: assets/icons/globe.svg
  String get globe => 'assets/icons/globe.svg';

  /// File path: assets/icons/home.svg
  String get home => 'assets/icons/home.svg';

  /// File path: assets/icons/theme.svg
  String get theme => 'assets/icons/theme.svg';

  /// List of all assets
  List<String> get values => [search, globe, home, theme];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/busniess.png
  AssetGenImage get busniess =>
      const AssetGenImage('assets/images/busniess.png');

  /// File path: assets/images/busniess_dark.png
  AssetGenImage get busniessDark =>
      const AssetGenImage('assets/images/busniess_dark.png');

  /// File path: assets/images/entertainment.png
  AssetGenImage get entertainment =>
      const AssetGenImage('assets/images/entertainment.png');

  /// File path: assets/images/entertainment_dark.png
  AssetGenImage get entertainmentDark =>
      const AssetGenImage('assets/images/entertainment_dark.png');

  /// File path: assets/images/general.png
  AssetGenImage get general => const AssetGenImage('assets/images/general.png');

  /// File path: assets/images/general_dark.png
  AssetGenImage get generalDark =>
      const AssetGenImage('assets/images/general_dark.png');

  /// File path: assets/images/health.png
  AssetGenImage get health => const AssetGenImage('assets/images/health.png');

  /// File path: assets/images/health_dark.png
  AssetGenImage get healthDark =>
      const AssetGenImage('assets/images/health_dark.png');

  /// File path: assets/images/mic.png
  AssetGenImage get mic => const AssetGenImage('assets/images/mic.png');

  /// File path: assets/images/mic_dark.png
  AssetGenImage get micDark =>
      const AssetGenImage('assets/images/mic_dark.png');

  /// File path: assets/images/news_branding.png
  AssetGenImage get newsBranding =>
      const AssetGenImage('assets/images/news_branding.png');

  /// File path: assets/images/news_branding_dark.png
  AssetGenImage get newsBrandingDark =>
      const AssetGenImage('assets/images/news_branding_dark.png');

  /// File path: assets/images/science.png
  AssetGenImage get science => const AssetGenImage('assets/images/science.png');

  /// File path: assets/images/science_dark.png
  AssetGenImage get scienceDark =>
      const AssetGenImage('assets/images/science_dark.png');

  /// File path: assets/images/sport.png
  AssetGenImage get sport => const AssetGenImage('assets/images/sport.png');

  /// File path: assets/images/sport_dark.png
  AssetGenImage get sportDark =>
      const AssetGenImage('assets/images/sport_dark.png');

  /// File path: assets/images/technology.png
  AssetGenImage get technology =>
      const AssetGenImage('assets/images/technology.png');

  /// File path: assets/images/technology_dark.png
  AssetGenImage get technologyDark =>
      const AssetGenImage('assets/images/technology_dark.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    busniess,
    busniessDark,
    entertainment,
    entertainmentDark,
    general,
    generalDark,
    health,
    healthDark,
    mic,
    micDark,
    newsBranding,
    newsBrandingDark,
    science,
    scienceDark,
    sport,
    sportDark,
    technology,
    technologyDark,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
