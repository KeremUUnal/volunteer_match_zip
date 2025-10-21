import 'package:flutter/material.dart';
import '../ui/pages/get_started_page.dart';
import '../ui/pages/home/home_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case GetStartedPage.route:
        return _fade(const GetStartedPage());
      case HomePage.route:
        return _fade(const HomePage());
      default:
        return _fade(const GetStartedPage());
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
