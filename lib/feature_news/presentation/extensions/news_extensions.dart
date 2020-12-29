import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/presentation/models/news_model.dart';

extension NewsEntityX on NewsEntity {
  NewsUIModel get toUIModel => NewsUIModel(this);
}

extension NewsEntityListX on List<NewsEntity> {
  List<NewsUIModel> get toUIModel => this.map((e) => e.toUIModel).toList();
}
