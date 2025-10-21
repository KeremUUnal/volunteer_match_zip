import 'package:flutter/material.dart';

import '../features/home/pages/home_page.dart';
import '../features/splash/pages/splash_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashPage.route:
        return _fade(const SplashPage());
      case HomePage.route:
        return _fade(const HomePage());
      default:
        return _fade(const SplashPage());
    }
  }

  static PageRouteBuilder _fade(Widget child) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => child,
      transitionsBuilder: (_, anim, __, child) =>
          FadeTransition(opacity: anim, child: child),
    );
  }
}
