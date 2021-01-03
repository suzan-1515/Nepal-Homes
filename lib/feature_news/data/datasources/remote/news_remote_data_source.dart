import 'package:nepal_homes/feature_news/data/datasources/remote/remote_data_source.dart';
import 'package:nepal_homes/feature_news/data/models/category_model.dart';
import 'package:nepal_homes/feature_news/data/models/news_detail_model.dart';
import 'package:nepal_homes/feature_news/data/models/paginated_news_model.dart';
import 'package:nepal_homes/feature_news/data/services/remote_service.dart';

class NewsRemoteDataSource with RemoteDataSource {
  final RemoteService _remoteService;

  NewsRemoteDataSource(this._remoteService);

  @override
  Future<CategoryWrapperModel> fetchCategories({int page}) async {
    var response = await _remoteService.fetchCategories(page: page);
    return CategoryWrapperModel.fromMap(response);
  }

  @override
  Future<PaginatedNewsModel> fetchCategoryNews({String slug, int page}) async {
    var response =
        await _remoteService.fetchCategoryNews(slug: slug, page: page);
    return PaginatedNewsModel.fromMap(response);
  }

  @override
  Future<PaginatedNewsModel> fetchHighlightNews() async {
    var response = await _remoteService.fetchHighlightNews();
    return PaginatedNewsModel.fromMap(response);
  }

  @override
  Future<PaginatedNewsModel> fetchLatestCategoryNews(
      {String categoryId, int page}) async {
    var response = await _remoteService.fetchLatestCategoryNews(
        categoryId: categoryId, page: page);
    return PaginatedNewsModel.fromMap(response);
  }

  @override
  Future<PaginatedNewsModel> fetchLatestNews() async {
    var response = await _remoteService.fetchLatestNews();
    return PaginatedNewsModel.fromMap(response);
  }

  @override
  Future<PaginatedNewsModel> fetchNews({int page}) async {
    var response = await _remoteService.fetchNews(page: page);
    return PaginatedNewsModel.fromMap(response);
  }

  @override
  Future<PaginatedNewsModel> fetchShowcaseNews() async {
    var response = await _remoteService.fetchShowcaseNews();
    return PaginatedNewsModel.fromMap(response);
  }

  @override
  Future<PaginatedNewsModel> fetchTrendingNews() async {
    var response = await _remoteService.fetchTrendingNews();
    return PaginatedNewsModel.fromMap(response);
  }

  @override
  Future<NewsDetailModel> fetchNewsDetail({String id}) async {
    var response = await _remoteService.fetchNewsDetail(id: id);
    return NewsDetailModel.fromMap(response);
  }
}
