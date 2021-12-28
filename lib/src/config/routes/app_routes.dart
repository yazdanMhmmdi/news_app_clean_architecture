import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/src/domain/entities/article.dart';
import 'package:news_app_clean_architecture/src/presentation/pages/article_details_page.dart';
import 'package:news_app_clean_architecture/src/presentation/pages/breaking_news_page.dart';
import 'package:news_app_clean_architecture/src/presentation/pages/saved_articles_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings? settings) {
    switch (settings!.name) {
      case '/':
        return _materialRoute(const BreakingNewsPage());
      case '/ArticleDetailsPage':
        return _materialRoute(ArticleDetailsPage(
          article: settings.arguments as Article,
        ));
      case '/SavedArticlesPage':
        return _materialRoute(const SavedArticlesPage());
      default:
        return _materialRoute(const BreakingNewsPage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
