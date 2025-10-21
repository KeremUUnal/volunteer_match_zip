import 'package:flutter/material.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/navigation/debug_navigate.dart';
import '../../../core/widgets/app_logo.dart';
import '../../../core/widgets/primary_button.dart';
import '../../home/pages/home_page.dart';
import '../widgets/illustration.dart';
import '../widgets/right_panel.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const String route = '/';

  // Sabit renkler
  static const Color _beige = Color(0xFFF5E9DA);
  static const Color _forest = Color(0xFF2F6E5E);

  // Sabit metin stilleri
  static const TextStyle _titleStyle = TextStyle(
    color: AppColors.text,
    fontWeight: FontWeight.w800,
    fontSize: 34, // displaySmall muadili
    letterSpacing: 0,
  );

  static const TextStyle _bodyStyle = TextStyle(
    color: AppColors.text, // altta %80 opaklıkla klonlayacağız
    fontSize: 16,
    height: 1.35,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _beige,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
        centerTitle: true,
        flexibleSpace: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  AppLogo(size: 34),
                  SizedBox(width: 10),
                  Text(
                    'Gönüllü Uygulaması',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.w800,
                      fontSize: 23.1, // 42 * .55
                      letterSpacing: .2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, c) {
          final isWide = c.maxWidth > 720;

          final column = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Hadi Başlayalım', style: _titleStyle),
              const SizedBox(height: 8),
              Text(
                'Topluluğa katkı sağlamak için rolünü seç: '
                'Gönüllü olarak katılabilir veya bir kurum adına etkinlikler oluşturabilirsin.',
                style: _bodyStyle.copyWith(
                  color: AppColors.text.withAlpha(204),
                ), // ~%80
              ),
              const SizedBox(height: 24),

              Center(
                child: Illustration(
                  assetPath:
                      'assets/illustrations/get_started_illustration.png',
                  height: isWide ? 360 : 260,
                  semanticLabel: 'İki kişinin çak yaptığı illüstrasyon',
                ),
              ),

              const SizedBox(height: 60),

              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      label: 'Gönüllü',
                      icon: Icons.handshake_rounded,
                      textColor: Colors.white,
                      backgroundColor: _forest,
                      onPressed: () {
                        Navigator.pushNamed(context, HomePage.route);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: PrimaryButton(
                      label: 'Kurum',
                      textColor: _forest,
                      backgroundColor: _beige,
                      icon: Icons.apartment_rounded,
                      onPressed: () {
                        debugNavigate(context, 'organization');
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
              children: const [
                Expanded(
                  child: SizedBox(child: null),
                ), // placeholder replaced below
              ],
            ).copyWithChildren([
              Expanded(child: column),
              const SizedBox(width: 32),
              const Expanded(child: RightPanel()),
            ]);
          } else {
            return SingleChildScrollView(child: column);
          }
        },
      ),
    );
  }
}

// küçük yardımcı: Row(children:[...]) yerine runtime’da çocuk eklemek için.
// İstersen kaldırıp doğrudan Row(children:[ ... ]) yazabilirsin.
extension _RowCopy on Row {
  Row copyWithChildren(List<Widget> children) => Row(
    key: key,
    mainAxisAlignment: mainAxisAlignment,
    mainAxisSize: mainAxisSize,
    crossAxisAlignment: crossAxisAlignment,
    textDirection: textDirection,
    verticalDirection: verticalDirection,
    textBaseline: textBaseline,
    children: children,
  );
}
