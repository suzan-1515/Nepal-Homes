import 'package:nepal_homes/core/exceptions/app_exceptions.dart';
import 'package:nepal_homes/core/network/network_info.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_news/data/datasources/remote/remote_data_source.dart';
import 'package:nepal_homes/feature_news/domain/entities/category_entity.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_detail_entity.dart';
import 'package:nepal_homes/feature_news/domain/entities/news_entity.dart';
import 'package:nepal_homes/feature_news/domain/repositories/repository.dart';

class NewsRepository with Repository {
  final RemoteDataSource _remoteDataSource;
  final AnalyticsService _analyticsService;
  final NetworkInfo _networkInfo;

  NewsRepository(
      this._remoteDataSource, this._analyticsService, this._networkInfo);

  @override
  Future<CategoryWrapperEntity> getCategories({int page}) async {
    if (!(await _networkInfo.isConnected)) throw NetworkException();
    return _remoteDataSource.fetchCategories(page: page);
  }

  @override
  Future<PaginatedNewsEntity> getCategoryNews({String slug, int page}) async {
    if (!(await _networkInfo.isConnected)) throw NetworkException();
    return _remoteDataSource.fetchCategoryNews(slug: slug, page: page);
  }

  @override
  Future<PaginatedNewsEntity> getHighlightNews() async {
    if (!(await _networkInfo.isConnected)) throw NetworkException();
    return _remoteDataSource.fetchHighlightNews();
  }

  @override
  Future<PaginatedNewsEntity> getLatestCategoryNews(
      {String categoryId, int page}) async {
    if (!(await _networkInfo.isConnected)) throw NetworkException();
    return _remoteDataSource.fetchLatestCategoryNews(
        categoryId: categoryId, page: page);
  }

  @override
  Future<PaginatedNewsEntity> getLatestNews() async {
    if (!(await _networkInfo.isConnected)) throw NetworkException();
    return _remoteDataSource.fetchLatestNews();
  }

  @override
  Future<PaginatedNewsEntity> getNews({int page}) async {
    if (!(await _networkInfo.isConnected)) throw NetworkException();
    return _remoteDataSource.fetchNews(page: page);
  }

  @override
  Future<PaginatedNewsEntity> getShowcaseNews() async {
    if (!(await _networkInfo.isConnected)) throw NetworkException();
    return _remoteDataSource.fetchShowcaseNews();
  }

  @override
  Future<PaginatedNewsEntity> getTrendingNews() async {
    if (!(await _networkInfo.isConnected)) throw NetworkException();
    return _remoteDataSource.fetchTrendingNews();
  }

  @override
  Future<NewsDetailEntity> getNewsDetail({String id}) async {
    if (!(await _networkInfo.isConnected)) throw NetworkException();
    return _remoteDataSource.fetchNewsDetail(id: id);
  }
}
