import 'dart:io';

import 'package:news_app_clean_architecture/src/data/datasources/local/app_database.dart';
import 'package:news_app_clean_architecture/src/data/datasources/remote/news_api_service.dart';
import 'package:news_app_clean_architecture/src/domain/entities/article.dart';
import 'package:news_app_clean_architecture/src/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/src/core/params/aticle_request.dart';
import 'package:news_app_clean_architecture/src/domain/repositories/articles_repository.dart';
import 'package:dio/dio.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  ArticlesRepositoryImpl(this._newsApiService, this._appDatabase);
  //  Api Service
  final NewsApiService _newsApiService;

  //  Database
  final AppDatabase _appDatabase;

  @override
  Future<DataState<List<Article>>> getBreakingNewsArticles(
      ArticlesRequestParams params) async {
    try {
      final httpResponse = await _newsApiService.getBreakingNewsArticles(
          apiKey: params.apiKey,
          country: params.country,
          category: params.category,
          page: params.page,
          pageSize: params.pageSize);

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.articles!);
      }
      return DataFailed(DioError(
        error: httpResponse.response.statusMessage,
        response: httpResponse.response,
        type: DioErrorType.response,
        requestOptions: httpResponse.response.requestOptions,
      ));
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<Article>> getSavedArticles() {
    return _appDatabase.articlesDao.getAllArticles();
  }

  @override
  Future<void> removeArticle(Article article) {
    return _appDatabase.articlesDao.deleteArticle(article);
  }

  @override
  Future<void> saveArticle(Article article) {
    return _appDatabase.articlesDao.insertArticle(article);
  }
}
