import 'package:news_app_clean_architecture/src/core/params/aticle_request.dart';
import 'package:news_app_clean_architecture/src/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/src/domain/entities/article.dart';

abstract class ArticlesRepository {
  Future<DataState<List<Article>>> getBreakingNewsArticles(
    ArticlesRequestParams params,
  );
}
