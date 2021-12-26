import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/src/config/routes/app_routes.dart';
import 'package:news_app_clean_architecture/src/config/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      theme: AppTheme.light,
    );
  }
}
