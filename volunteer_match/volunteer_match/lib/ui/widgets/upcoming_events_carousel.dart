import 'package:flutter/material.dart';
import '../../../../data/demo_data.dart';

class UpcomingEventsCarousel extends StatefulWidget {
  const UpcomingEventsCarousel({super.key, required this.events});
  final List<DemoEvent> events;

  @override
  State<UpcomingEventsCarousel> createState() => _UpcomingEventsCarouselState();
}

class _UpcomingEventsCarouselState extends State<UpcomingEventsCarousel> {
  late final PageController _pc;
  double _page = 0;

  @override
  void initState() {
    super.initState();
    _pc = PageController(viewportFraction: .86);
    _pc.addListener(() => setState(() => _page = _pc.page ?? 0));
  }

  @override
  void dispose() {
    _pc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: _pc,
            itemCount: widget.events.length,
            itemBuilder: (context, i) {
              final e = widget.events[i];
              final scale = (1 - ((_page - i).abs() * 0.08)).clamp(0.9, 1.0);
              return Transform.scale(
                scale: scale,
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              // ignore: deprecated_member_use
                              color: cs.primary.withOpacity(.15),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(e.icon, color: cs.primary),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  e.title,
                                  style: t.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '${e.location} • ${e.date}',
                                  style: t.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right_rounded),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.events.length, (i) {
            final active = (i - _page).abs() < 0.5;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 6,
              width: active ? 16 : 6,
              decoration: BoxDecoration(
                color: active ? cs.primary : cs.outlineVariant,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }),
        ),
      ],
    );
  }
}
