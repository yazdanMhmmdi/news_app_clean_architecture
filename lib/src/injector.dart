import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/src/data/datasources/remote/news_api_service.dart';
import 'package:news_app_clean_architecture/src/data/repositories/articles_repository_impl.dart';
import 'package:news_app_clean_architecture/src/domain/repositories/articles_repository.dart';
import 'package:news_app_clean_architecture/src/domain/usecases/get_articles_usecase.dart';
import 'package:news_app_clean_architecture/src/presentation/blocs/bloc/remote_articles_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  //  Dio Client
  injector.registerSingleton<Dio>(Dio());

  //  Dependencies
  injector.registerSingleton<NewsApiService>(NewsApiService(injector()));
  injector.registerSingleton<ArticlesRepository>(
      ArticlesRepositoryImpl(injector()));

  //  UseCases
  injector
      .registerSingleton<GetArticlesUseCase>(GetArticlesUseCase(injector()));

  //  Blocs
  injector.registerFactory<RemoteArticlesBloc>(
      () => RemoteArticlesBloc(injector()));
}
