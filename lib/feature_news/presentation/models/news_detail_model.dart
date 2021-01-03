import 'package:nepal_homes/feature_news/domain/entities/news_detail_entity.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsDetailUIModel extends Model {
  NewsDetailEntity _news;

  NewsDetailUIModel(this._news);

  set(NewsEntity news) {
    this._news = _news.copyWith(data: news);
    notifyListeners();
  }

  NewsEntity get entity => this._news.data;
}
