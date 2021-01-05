import 'package:nepal_homes/feature_news/domain/entities/category_entity.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_detail_entity.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/presentation/models/category_model.dart';
import 'package:nepal_homes/feature_news/presentation/models/news_detail_model.dart';
import 'package:nepal_homes/feature_news/presentation/models/news_model.dart';

extension NewsEntityX on NewsEntity {
  NewsUIModel get toUIModel => NewsUIModel(this);
}

extension NewsEntityListX on List<NewsEntity> {
  List<NewsUIModel> get toUIModel => this.map((e) => e.toUIModel).toList();
}

extension NewsDetailEntityX on NewsDetailEntity {
  NewsDetailUIModel get toUIModel => NewsDetailUIModel(this);
}

extension NewsCategoryEntityX on CategoryEntity {
  NewsCategoryUIModel get toUIModel => NewsCategoryUIModel(this);
}
