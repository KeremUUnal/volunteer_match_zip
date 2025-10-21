import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'routes/app_router.dart';
import 'ui/pages/get_started_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VolunteerMatchApp());
}

class VolunteerMatchApp extends StatelessWidget {
  const VolunteerMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volunteer Match',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system, // sistem koyu/açık temayı otomatik uygular
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: GetStartedPage.route,
    );
  }
}
