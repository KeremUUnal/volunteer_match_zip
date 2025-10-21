import 'package:flutter/material.dart';
import 'dart:math' as math;

// ...

class AchievementsStrip extends StatelessWidget {
  const AchievementsStrip({
    super.key,
    required this.currentPoints,
    required this.nextTarget,
    required this.badges,
  });

  final int currentPoints;
  final int nextTarget;
  final List<IconData> badges;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;

    // Güvenli yüzde hesabı (0..1 arası double)
    final double pct = nextTarget <= 0
        ? 0.0
        : (currentPoints / nextTarget)
              .clamp(0.0, 1.0) // num döner
              .toDouble(); // double’a çevir

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: badges.map((ic) {
                return CircleAvatar(
                  radius: 22,
                  backgroundColor: cs.primary.withOpacity(.12),
                  child: Icon(ic, color: cs.primary),
                );
              }).toList(),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      minHeight: 10,
                      value: pct, // artık double
                      backgroundColor: cs.surfaceContainerHighest.withOpacity(
                        .5,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${math.min(currentPoints, nextTarget)} / $nextTarget',
                  style: t.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text('Hedefe kalan puanları gör'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
