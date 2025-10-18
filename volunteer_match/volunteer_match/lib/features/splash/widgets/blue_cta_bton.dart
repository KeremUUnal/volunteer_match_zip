import 'package:flutter/material.dart';

/// Mavi arkaplan + sabit border.
/// Dışarıdan sadece [label] ve [onTap] bekler. Diğer görsel ayarlar sabittir.
class BlueCtaButton extends StatelessWidget {
  const BlueCtaButton({
    super.key,
    required this.label,
    required this.onTap,
    this.fullWidth = true,
  });

  final String label;
  final VoidCallback onTap;
  final bool fullWidth;

  static const _bgColor = Color(0xFF57B3DB);
  static const _borderColor = Color(0xFF2F8FB8);
  static const _radius = 16.0;

  @override
  Widget build(BuildContext context) {
    final btn = Material(
      color: _bgColor,
      borderRadius: BorderRadius.circular(_radius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(_radius),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_radius),
            border: Border.all(color: _borderColor, width: 1.5),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: .2,
            ),
          ),
        ),
      ),
    );

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: btn);
    }
    return btn;
  }
}
