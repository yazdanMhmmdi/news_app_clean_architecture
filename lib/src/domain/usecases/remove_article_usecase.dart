import 'package:news_app_clean_architecture/src/core/usecases/usecase.dart';
import 'package:news_app_clean_architecture/src/domain/entities/article.dart';
import 'package:news_app_clean_architecture/src/domain/repositories/articles_repository.dart';

class RemoveArticleUseCase implements UseCase<void, Article?> {
  final ArticlesRepository _articlesRepository;

  RemoveArticleUseCase(this._articlesRepository);

  @override
  Future<void> call({Article? params}) {
    return _articlesRepository.removeArticle(params!);
  }
}
