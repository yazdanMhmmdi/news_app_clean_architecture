import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/src/config/routes/app_routes.dart';
import 'package:news_app_clean_architecture/src/config/themes/app_theme.dart';
import 'package:news_app_clean_architecture/src/injector.dart';
import 'package:news_app_clean_architecture/src/presentation/blocs/bloc/remote_articles_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_architecture/src/presentation/widgets/my_scroll_behavior.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => injector()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Flutter Demo',
        onGenerateRoute: AppRoutes.onGenerateRoutes,
        theme: AppTheme.light,
        scrollBehavior: MyCustomScrollBehavior(),
      ),
    );
  }
}
