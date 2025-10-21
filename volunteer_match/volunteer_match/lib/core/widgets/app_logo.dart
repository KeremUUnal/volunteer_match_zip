import 'package:flutter/material.dart';
import 'package:prologue/core/constants/color_constants.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.size = 42});
  final double size;

  static const Color _onSeed = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppColors.seed,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.volunteer_activism,
            color: AppColors.white,
            size: size * .58,
          ),
        ),
      ],
    );
  }
}
