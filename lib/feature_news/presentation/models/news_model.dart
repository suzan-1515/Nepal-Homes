import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:scoped_model/scoped_model.dart';

class NewsUIModel extends Model {
  NewsEntity _paginatedNews;

  NewsUIModel(this._paginatedNews);

  set(NewsEntity paginatedNews) {
    this._paginatedNews = paginatedNews;
    notifyListeners();
  }

  NewsEntity get entity => this._paginatedNews;
}
