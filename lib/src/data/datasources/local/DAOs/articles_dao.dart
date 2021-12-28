import 'package:floor/floor.dart';
import 'package:news_app_clean_architecture/src/core/utils/constants.dart';
import 'package:news_app_clean_architecture/src/domain/entities/article.dart';

@dao
abstract class ArticlesDao {
  @Query('SELECT * FROM $kArticlesTableName')
  Future<List<Article>> getAllArticles();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertArticle(Article article);

  @delete
  Future<void> deleteArticle(Article article);
}
