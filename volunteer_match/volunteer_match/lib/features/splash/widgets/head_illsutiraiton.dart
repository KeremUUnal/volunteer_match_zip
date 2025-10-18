import 'package:flutter/material.dart';

/// Üstteki illüstrasyon yerine ikon gösteren sade versiyon.
/// Varsayılan ikon: handshake.
class HeadIllustration extends StatelessWidget {
  const HeadIllustration({
    super.key,
    this.icon = Icons.handshake_rounded,
    this.iconColor = const Color(0xFF2E7D9B),
    this.maxHeight = 260,
    this.backgroundColor = Colors.transparent,
  });

  final IconData icon;
  final Color iconColor;
  final double maxHeight;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: AspectRatio(
        aspectRatio: 16 / 11,
        child: DecoratedBox(
          decoration: BoxDecoration(color: backgroundColor),
          child: Center(
            child: Icon(
              icon,
              size: maxHeight * 0.6, // boyutu orantılı belirliyoruz
              color: iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
