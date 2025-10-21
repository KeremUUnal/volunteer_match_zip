import 'package:flutter/material.dart';
import 'home/home_page.dart';

import '/ui/widgets/app_logo.dart';
import '/ui/widgets/illustration.dart';
import '/ui/widgets/primary_button.dart';
import '/ui/widgets/secondary_button.dart';
import '/ui/widgets/safe_scaffold.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);

    return SafeScaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Geri',
          onPressed: () => Navigator.maybePop(context),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: const AppLogo(size: 34),
        actions: [
          IconButton(
            tooltip: 'Tema',
            onPressed: () {
              // Bu örnekte sadece SnackBar ile gösteriyoruz.
              // Gerçek temayı Provider/Bloc ile yönetebilirsin.
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tema ayarı: Sistem varsayılanı')),
              );
            },
            icon: Icon(
              t.brightness == Brightness.dark
                  ? Icons.dark_mode_rounded
                  : Icons.light_mode_rounded,
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, c) {
          final isWide = c.maxWidth > 720;
          final column = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hadi Başlayalım',
                style: t.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Topluluğa katkı sağlamak için rolünü seç: '
                'Gönüllü olarak katılabilir veya bir kurum adına etkinlikler oluşturabilirsin.',
                style: t.textTheme.titleMedium?.copyWith(
                  // ignore: deprecated_member_use
                  color: t.textTheme.titleMedium?.color?.withOpacity(.8),
                ),
              ),
              const SizedBox(height: 24),

              // İllüstrasyon
              Center(
                child: Illustration(
                  assetPath:
                      'assets/illustrations/get_started_illustration.png',
                  height: isWide ? 360 : 260,
                  semanticLabel: 'İki kişinin çak yaptığı illüstrasyon',
                ),
              ),

              const SizedBox(height: 60),

              // Butonlar
              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      label: 'Gönüllü',
                      icon: Icons.handshake_rounded,
                      onPressed: () {
                        Navigator.pushNamed(context, HomePage.route);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SecondaryButton(
                      label: 'Kurum',
                      icon: Icons.apartment_rounded,
                      onPressed: () {
                        _debugNavigate(context, 'organization');
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
            ],
          );

          if (isWide) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: column),
                const SizedBox(width: 32),
                Expanded(child: _RightPanel()),
              ],
            );
          } else {
            return SingleChildScrollView(child: column);
          }
        },
      ),
    );
  }

  void _debugNavigate(BuildContext context, String where) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Seçim: $where (navigasyon yer tutucu)')),
    );
  }
}

class _RightPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 8),
        Text(
          'Neler Sunuyoruz?',
          style: t.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 10),
        _FeatureTile(
          icon: Icons.event_available_rounded,
          title: 'Etkinlikleri Keşfet',
          subtitle:
              'Yakınındaki etkinlikleri filtrele, başvur, takvimine ekle.',
        ),
        _FeatureTile(
          icon: Icons.emoji_events_rounded,
          title: 'Rozet & Puan',
          subtitle: 'Katıldıkça rozet kazan, profilini güçlendir.',
        ),
        _FeatureTile(
          icon: Icons.chat_bubble_rounded,
          title: 'Mesajlaşma',
          subtitle: 'Kurumlarla güvenli şekilde iletişime geç.',
        ),
      ],
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final cs = t.colorScheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: cs.outlineVariant),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: cs.primary.withOpacity(.15),
            child: Icon(icon, color: cs.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: t.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(subtitle, style: t.textTheme.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
