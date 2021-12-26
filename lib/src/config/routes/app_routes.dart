import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/src/presentation/pages/breaking_news_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const BreakingNewsPage());
      default:
        return _materialRoute(const BreakingNewsPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
