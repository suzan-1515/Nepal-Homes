import 'package:meta/meta.dart';

mixin RemoteService {
  Future<dynamic> fetchNews({@required int page});

  Future<dynamic> fetchLatestNews();

  Future<dynamic> fetchHighlightNews();

  Future<dynamic> fetchShowcaseNews();

  Future<dynamic> fetchTrendingNews();

  Future<dynamic> fetchCategories({@required int page});

  Future<dynamic> fetchCategoryNews(
      {@required String slug, @required int page});

  Future<dynamic> fetchLatestCategoryNews(
      {@required String categoryId, @required int page});
}