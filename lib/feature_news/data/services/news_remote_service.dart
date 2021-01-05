import 'package:nepal_homes/core/network/http_manager/http_manager.dart';
import 'package:nepal_homes/feature_news/data/services/remote_service.dart';

class NewsRemoteService with RemoteService {
  static const NEWS_ENDPOINT = '/blog/public';
  static const LATEST_NEWS_ENDPOINT = '/blog/latest';
  static const TRENDING_NEWS_ENDPOINT = '/blog/trending';
  static const SHOWCASE_NEWS_ENDPOINT = '/blog/showcase';
  static const HIGHLIGHT_NEWS_ENDPOINT = '/blog/highlight';
  static const NEWS_CATEGORY_ENDPOINT = '/blog/category';
  static const NEWS_BY_CATEGORY_ENDPOINT = '/blog/blogbycat';
  static const NEWS_DETAIL_ENDPOINT = '/blog/blog';
  static const RELATED_NEWS_ENDPOINT = '/blog/related';
  final HttpManager _httpManager;

  NewsRemoteService(this._httpManager);

  @override
  Future fetchCategories({int page}) {
    Map<String, String> query = {
      'is_active': 'true',
      'page': page?.toString(),
    };

    return _httpManager.get(path: NEWS_CATEGORY_ENDPOINT, query: query);
  }

  @override
  Future fetchCategoryNews({String slug, int page}) {
    Map<String, String> query = {
      'is_active': 'true',
      'page': page?.toString(),
    };
    var path = '$NEWS_BY_CATEGORY_ENDPOINT/$slug';

    return _httpManager.get(path: path, query: query);
  }

  @override
  Future fetchHighlightNews() {
    return _httpManager.get(path: HIGHLIGHT_NEWS_ENDPOINT);
  }

  @override
  Future fetchLatestCategoryNews({String categoryId, int size}) {
    Map<String, String> query = {
      'size': size?.toString(),
    };
    var path = '$LATEST_NEWS_ENDPOINT/$categoryId';

    return _httpManager.get(path: path, query: query);
  }

  @override
  Future fetchLatestNews() {
    return _httpManager.get(path: LATEST_NEWS_ENDPOINT);
  }

  @override
  Future fetchNews({int page}) {
    Map<String, String> query = {
      'page': page?.toString(),
    };

    return _httpManager.get(path: NEWS_ENDPOINT, query: query);
  }

  @override
  Future fetchShowcaseNews() {
    return _httpManager.get(path: SHOWCASE_NEWS_ENDPOINT);
  }

  @override
  Future fetchTrendingNews() {
    return _httpManager.get(path: TRENDING_NEWS_ENDPOINT);
  }

  @override
  Future fetchNewsDetail({String id}) {
    final path = '$NEWS_DETAIL_ENDPOINT/$id';
    return _httpManager.get(path: path);
  }

  @override
  Future fetchRelatedNews({String newsId}) {
    final path = '$RELATED_NEWS_ENDPOINT/$newsId';
    return _httpManager.get(path: path);
  }
}
