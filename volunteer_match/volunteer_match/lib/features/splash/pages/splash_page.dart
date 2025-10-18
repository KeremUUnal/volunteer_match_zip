import 'package:flutter/material.dart';

import '../widgets/blue_cta_bton.dart';
import '../widgets/head_illsutiraiton.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFFF6E9D6);

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black87,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
          tooltip: 'Back',
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, c) {
            final maxW = c.maxWidth.clamp(320.0, 600.0);
            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxW),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      HeadIllustration(maxHeight: 260),
                      const SizedBox(height: 28),

                      // Başlık
                      Text(
                        "Let's Get Started",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: Colors.black87,
                              height: 1.15,
                            ),
                      ),

                      const Spacer(),

                      BlueCtaButton(label: 'Volunteer', onTap: () {}),
                      const SizedBox(height: 16),
                      BlueCtaButton(label: 'Organization', onTap: () {}),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
