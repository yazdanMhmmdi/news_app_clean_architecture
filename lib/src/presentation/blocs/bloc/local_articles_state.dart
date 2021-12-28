part of 'local_articles_bloc.dart';

abstract class LocalArticlesState extends Equatable {
  const LocalArticlesState({this.articles});
  final List<Article>? articles;

  @override
  List<Object> get props => [];
}

class LocalArticlesLoading extends LocalArticlesState {
  const LocalArticlesLoading();
}

class LoacalArticlesDone extends LocalArticlesState {
  const LoacalArticlesDone(List<Article> articles) : super(articles: articles);
}
