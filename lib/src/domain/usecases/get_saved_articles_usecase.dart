import 'package:news_app_clean_architecture/src/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/src/core/usecases/usecase.dart';
import 'package:news_app_clean_architecture/src/domain/entities/article.dart';
import 'package:news_app_clean_architecture/src/domain/repositories/articles_repository.dart';

class GetSavedArticlesUseCase implements UseCase<List<Article>, void> {
  final ArticlesRepository _articlesRepository;
  GetSavedArticlesUseCase(this._articlesRepository);

  @override
  Future<List<Article>> call({params}) {
    return _articlesRepository.getSavedArticles();
  }
}
