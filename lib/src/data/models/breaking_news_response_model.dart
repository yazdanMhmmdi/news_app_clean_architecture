import 'dart:convert';

import 'package:collection/collection.dart';

import 'package:news_app_clean_architecture/src/data/models/article_model.dart';

class BreakingNewsResponseModel {
  factory BreakingNewsResponseModel.fromJson(Map<String, dynamic> json) {
    return BreakingNewsResponseModel(
        status: json['status'],
        totalResult: json['totalResults'] as int,
        articles: List<ArticleModel>.from((json['articles'] as List<dynamic>)
            .map((e) => ArticleModel.fromJson(e as Map<String, dynamic>))));
  }
  BreakingNewsResponseModel({
    this.status,
    this.totalResult,
    this.articles,
  });
  final String? status;
  final int? totalResult;
  final List<ArticleModel>? articles;
}
