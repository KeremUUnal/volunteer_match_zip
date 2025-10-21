import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';
import '../../../data/demo_data.dart';
import '/ui/widgets/upcoming_events_carousel.dart';
import '/ui/widgets/achievements_strip.dart';
import '/ui/widgets/organizations_strip.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: cs.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Icon(
                Icons.volunteer_activism,
                color: cs.onPrimary,
                size: 20,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'Gönüllü Uygulaması',
              style: TextStyle(fontWeight: FontWeight.w800),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_suggest_rounded),
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Upcoming Events ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Yaklaşan Etkinlikler',
                    style: t.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: const Text('Tümü')),
                ],
              ),
              const SizedBox(height: 8),
              UpcomingEventsCarousel(events: demoEvents),

              const SizedBox(height: 24),

              // --- Achievements / Points ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Başarıların',
                    style: t.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  TextButton(onPressed: () {}, child: const Text('Daha Fazla')),
                ],
              ),
              const AchievementsStrip(
                currentPoints: 793,
                nextTarget: 1000,
                badges: [
                  Icons.workspace_premium_rounded,
                  Icons.military_tech_rounded,
                  Icons.volunteer_activism_rounded,
                  Icons.handshake_rounded,
                ],
              ),

              const SizedBox(height: 24),

              // --- Most Supported Organizations ---
              Text(
                'En Çok Desteklenen Kurumlar',
                style: t.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              OrganizationsStrip(orgs: demoOrgs),
            ],
          ),
        ),
      ),

      // --- Bottom Navigation (yeşil) ---
      bottomNavigationBar: Theme(
        data: t.copyWith(
          bottomNavigationBarTheme: t.bottomNavigationBarTheme.copyWith(
            backgroundColor: AppTheme.forest, // koyu yeşil
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            type: BottomNavigationBarType.fixed,
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _navIndex,
          onTap: (i) {
            setState(() => _navIndex = i);
            // TODO: i==1 Discover, i==2 Mesajlar, i==3 Profil sayfalarına yönlendir
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: 'Ana Sayfa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: 'Keşfet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_rounded),
              label: 'Mesaj',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
