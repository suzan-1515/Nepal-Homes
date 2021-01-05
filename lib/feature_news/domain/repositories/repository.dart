import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_news/domain/entities/category_entity.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_detail_entity.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';

mixin Repository {
  Future<PaginatedNewsEntity> getNews({@required int page});

  Future<PaginatedNewsEntity> getLatestNews();

  Future<PaginatedNewsEntity> getHighlightNews();

  Future<PaginatedNewsEntity> getShowcaseNews();

  Future<PaginatedNewsEntity> getTrendingNews();

  Future<PaginatedNewsEntity> getRelatedNews({@required String newsId});

  Future<CategoryWrapperEntity> getCategories({@required int page});

  Future<PaginatedNewsEntity> getCategoryNews(
      {@required String slug, @required int page});

  Future<PaginatedNewsEntity> getLatestCategoryNews(
      {@required String categoryId, @required int size});

  Future<NewsDetailEntity> getNewsDetail({@required String id});
}
