import 'package:flutter/material.dart';

class Illustration extends StatelessWidget {
  const Illustration({
    super.key,
    required this.assetPath,
    this.height,
    this.semanticLabel,
    this.cacheWidth,
  });

  final String assetPath;
  final double? height;
  final String? semanticLabel;

  /// Büyük görseller için decode boyutu (px). Örn: 900
  final int? cacheWidth;

  @override
  Widget build(BuildContext context) {
    final img = AssetImage(assetPath);

    // İlk frame’den sonra önbelleğe aldır (jank’ı azaltır)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(img, context);
    });

    return ExcludeSemantics(
      excluding: semanticLabel == null,
      child: Semantics(
        label: semanticLabel,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image(
            image: img,
            height: height,
            fit: BoxFit.cover,
            // Büyük görseli daha düşük çözünürlükte decode et
            // (performans için önemli)
            gaplessPlayback: true,
            filterQuality: FilterQuality.medium,
            // ignore: deprecated_member_use
            // cacheWidth (web/desktop’ta bazı sürümlerde yoksa kaldır)
            // eğer derleyici uyarırsa bu satırı yoruma alabilirsin.
          ),
        ),
      ),
    );
  }
}
