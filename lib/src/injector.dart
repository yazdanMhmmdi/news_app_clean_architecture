import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/src/core/utils/constants.dart';
import 'package:news_app_clean_architecture/src/data/datasources/local/app_database.dart';
import 'package:news_app_clean_architecture/src/data/datasources/remote/news_api_service.dart';
import 'package:news_app_clean_architecture/src/data/repositories/articles_repository_impl.dart';
import 'package:news_app_clean_architecture/src/domain/repositories/articles_repository.dart';
import 'package:news_app_clean_architecture/src/domain/usecases/get_articles_usecase.dart';
import 'package:news_app_clean_architecture/src/domain/usecases/get_saved_articles_usecase.dart';
import 'package:news_app_clean_architecture/src/domain/usecases/save_article_usecase.dart';
import 'package:news_app_clean_architecture/src/presentation/blocs/bloc/local_articles_bloc.dart';
import 'package:news_app_clean_architecture/src/presentation/blocs/bloc/remote_articles_bloc.dart';

import 'domain/usecases/remove_article_usecase.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  //  *
  final database =
      await $FloorAppDatabase.databaseBuilder(kDatabaseName).build();
  injector.registerSingleton<AppDatabase>(database);
  //  Dio Client
  injector.registerSingleton<Dio>(Dio());

  //  Dependencies
  injector.registerSingleton<NewsApiService>(NewsApiService(injector()));

  //  *
  injector.registerSingleton<ArticlesRepository>(
      ArticlesRepositoryImpl(injector(), injector()));

  //  UseCases
  injector
      .registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(injector()));

  //  *
  injector.registerSingleton<GetSavedArticlesUseCase>(
      GetSavedArticlesUseCase(injector()));

  injector.registerSingleton<RemoveArticleUseCase>(
      RemoveArticleUseCase(injector()));
  injector
      .registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(injector()));

  //  Blocs
  injector.registerFactory<RemoteArticlesBloc>(
      () => RemoteArticlesBloc(injector()));

  //  *
  injector.registerFactory<LocalArticlesBloc>(
      () => LocalArticlesBloc(injector(), injector(), injector()));
}
