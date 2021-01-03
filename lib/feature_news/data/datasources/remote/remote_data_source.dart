import 'package:meta/meta.dart';
import 'package:nepal_homes/feature_news/data/models/category_model.dart';
import 'package:nepal_homes/feature_news/data/models/news_detail_model.dart';
import 'package:nepal_homes/feature_news/data/models/paginated_news_model.dart';

mixin RemoteDataSource {
  Future<PaginatedNewsModel> fetchNews({@required int page});

  Future<PaginatedNewsModel> fetchLatestNews();

  Future<PaginatedNewsModel> fetchHighlightNews();

  Future<PaginatedNewsModel> fetchShowcaseNews();

  Future<PaginatedNewsModel> fetchTrendingNews();

  Future<CategoryWrapperModel> fetchCategories({@required int page});

  Future<PaginatedNewsModel> fetchCategoryNews(
      {@required String slug, @required int page});

  Future<PaginatedNewsModel> fetchLatestCategoryNews(
      {@required String categoryId, @required int page});

  Future<NewsDetailModel> fetchNewsDetail({@required String id});
}
