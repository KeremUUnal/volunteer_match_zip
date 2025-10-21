import 'package:flutter/material.dart';
import 'package:prologue/core/widgets/app_logo.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/widgets/navigationbar/custom_nav_bar.dart';
import '../../../data/demo_data.dart';
import '../widgets/achievements_strip.dart';
import '../widgets/organizations_strip.dart';
import '../widgets/upcoming_events_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _navIndex = 0;

  static const TextStyle _titleLg = TextStyle(
    color: AppColors.text,
    fontWeight: FontWeight.w800,
    fontSize: 22,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beige,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
        centerTitle: true,
        title: Row(
          children: const [
            AppLogo(),
            SizedBox(width: 10),
            Text(
              'Gönüllü Uygulaması',
              style: TextStyle(fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: const Text('Yaklaşan Etkinlikler', style: _titleLg),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Tümü',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              UpcomingEvents(events: demoEvents),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: const Text('Başarıların', style: _titleLg),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Daha Fazla',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: const Text(
                  'En Çok Desteklenen Kurumlar',
                  style: _titleLg,
                ),
              ),
              const SizedBox(height: 8),
              OrganizationsStrip(orgs: demoOrgs),
            ],
          ),
        ),
      ),

      bottomNavigationBar: CustomNavBar(
        currentIndex: _navIndex,
        onTap: (i) {
          setState(() => _navIndex = i);
        },
      ),
    );
  }
}
