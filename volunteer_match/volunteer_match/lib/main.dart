import 'package:flutter/material.dart';

import 'features/splash/pages/splash_page.dart';
import 'routes/app_router.dart';

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

      themeMode: ThemeMode.system,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: SplashPage.route,
    );
  }
}
