import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app_clean_architecture/src/core/bloc/bloc_with_state.dart';
import 'package:news_app_clean_architecture/src/core/params/aticle_request.dart';
import 'package:news_app_clean_architecture/src/core/resources/data_state.dart';
import 'package:news_app_clean_architecture/src/domain/entities/article.dart';
import 'package:dio/dio.dart';
import 'package:news_app_clean_architecture/src/domain/usecases/get_articles_usecase.dart';

part 'remote_articles_event.dart';
part 'remote_articles_state.dart';

class RemoteArticlesBloc
    extends BlocWithState<RemoteArticlesEvent, RemoteArticlesState> {
  final GetArticlesUseCase _getArticlesUseCase;

  RemoteArticlesBloc(this._getArticlesUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(_getBreakingNewsArticle);
  }

  final List<Article> _articles = [];
  int _page = 1;
  static const int _pageSize = 20;

  Future<void> _getBreakingNewsArticle(
      RemoteArticlesEvent event, Emitter<RemoteArticlesState> emit) async {
    DataState dataState =
        await _getArticlesUseCase(params: ArticlesRequestParams(page: _page));

    if (dataState is DataSuccess && dataState.data.isNotEmpty) {
      final articles = dataState.data;
      final noMoreData = articles.length < _pageSize;
      _articles.addAll(articles);
      _page++;

      emit(RemoteArticlesDone(_articles, noMoreData: noMoreData));
    }
    if (dataState is DataFailed) {
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
