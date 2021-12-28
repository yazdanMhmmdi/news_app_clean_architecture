import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_clean_architecture/src/domain/entities/article.dart';
import 'package:news_app_clean_architecture/src/domain/usecases/get_saved_articles_usecase.dart';
import 'package:news_app_clean_architecture/src/domain/usecases/remove_article_usecase.dart';
import 'package:news_app_clean_architecture/src/domain/usecases/save_article_usecase.dart';

part 'local_articles_event.dart';
part 'local_articles_state.dart';

class LocalArticlesBloc extends Bloc<LocalArticlesEvent, LocalArticlesState> {
  LocalArticlesBloc(this._getSavedArticlesUseCase, this._removeArticleUseCase,
      this._saveArticleUseCase)
      : super(const LocalArticlesLoading()) {
    on<GetAllSavedArticles>(_getAllSavedArticles);
    on<RemoveArticle>(_removeSavedArticles);
    on<SaveArticle>(_saveArticles);
  }

  final GetSavedArticlesUseCase _getSavedArticlesUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  Future<void> _getAllSavedArticles(
      GetAllSavedArticles event, Emitter<LocalArticlesState> emit) async {
    emit(const LocalArticlesLoading());
    final List<Article> articles = await _getSavedArticlesUseCase();

    emit(LoacalArticlesDone(articles));
  }

  Future<void> _removeSavedArticles(
      RemoveArticle event, Emitter<LocalArticlesState> emit) async {
    await _removeArticleUseCase(params: event.article);
    add(const GetAllSavedArticles());
  }

  Future<void> _saveArticles(
      SaveArticle event, Emitter<LocalArticlesState> emit) async {
    await _saveArticleUseCase(params: event.article);
    add(const GetAllSavedArticles());
  }
}
