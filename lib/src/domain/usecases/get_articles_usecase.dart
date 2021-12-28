import 'package:news_app_clean_architecture/src/core/params/aticle_request.dart';
import 'package:news_app_clean_architecture/src/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/src/core/usecases/usecase.dart';
import 'package:news_app_clean_architecture/src/domain/entities/article.dart';
import 'package:news_app_clean_architecture/src/domain/repositories/articles_repository.dart';

class GetArticlesUseCase
    implements UseCase<DataState<List<Article>>, ArticlesRequestParams?> {
  GetArticlesUseCase(this._articlesRepository);

  final ArticlesRepository? _articlesRepository;

  @override
  Future<DataState<List<Article>>> call({ArticlesRequestParams? params}) {
    return _articlesRepository!.getBreakingNewsArticles(params!);
  }
}
