import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nepal_homes/core/network/http_manager/http_manager.dart';
import 'package:nepal_homes/core/network/network_info.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_news/data/datasources/remote/news_remote_data_source.dart';
import 'package:nepal_homes/feature_news/data/datasources/remote/remote_data_source.dart';
import 'package:nepal_homes/feature_news/data/repositories/news_repository.dart';
import 'package:nepal_homes/feature_news/data/services/news_remote_service.dart';
import 'package:nepal_homes/feature_news/data/services/remote_service.dart';
import 'package:nepal_homes/feature_news/domain/repositories/repository.dart';
import 'package:nepal_homes/feature_news/domain/usecases/get_categories_use_case.dart';
import 'package:nepal_homes/feature_news/domain/usecases/get_news_by_author_use_case.dart';
import 'package:nepal_homes/feature_news/domain/usecases/usecases.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/author_news/author_news_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/category_news_list/category_news_list_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/highlight_news/highlight_news_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/latest_category_news_list/latest_category_news_list_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/latest_news/latest_news_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/news_category/news_category_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/news_detail/news_detail_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/news_list/news_list_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/related_news/related_news_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/showcase_news/showcase_news_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/trending_news/trending_news_cubit.dart';

class NewsProvider {
  NewsProvider._();

  static setup() {
    GetIt.I.registerLazySingleton<RemoteService>(
        () => NewsRemoteService(GetIt.I.get<HttpManager>()));
    GetIt.I.registerLazySingleton<RemoteDataSource>(
        () => NewsRemoteDataSource(GetIt.I.get<RemoteService>()));
    GetIt.I.registerLazySingleton<Repository>(() => NewsRepository(
        GetIt.I.get<RemoteDataSource>(),
        GetIt.I.get<AnalyticsService>(),
        GetIt.I.get<NetworkInfo>()));

    GetIt.I.registerLazySingleton<GetNewsUseCase>(
        () => GetNewsUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetLatestNewsUseCase>(
        () => GetLatestNewsUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetHighlightNewsUseCase>(
        () => GetHighlightNewsUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetShowcaseNewsUseCase>(
        () => GetShowcaseNewsUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetTrendingNewsUseCase>(
        () => GetTrendingNewsUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetLatestNewsByCategoryUseCase>(
        () => GetLatestNewsByCategoryUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetCategoryNewsUseCase>(
        () => GetCategoryNewsUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetNewsDetailUseCase>(
        () => GetNewsDetailUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetRelatedNewsUseCase>(
        () => GetRelatedNewsUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetCategoriesUseCase>(
        () => GetCategoriesUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetNewsByAuthorUseCase>(
        () => GetNewsByAuthorUseCase(GetIt.I.get<Repository>()));

    GetIt.I.registerFactory<NewsListCubit>(() => NewsListCubit(
          getNewsUseCase: GetIt.I.get<GetNewsUseCase>(),
        ));
    GetIt.I.registerFactory<LatestNewsCubit>(() => LatestNewsCubit(
          getLatestNewsUseCase: GetIt.I.get<GetLatestNewsUseCase>(),
        )..getNews());
    GetIt.I.registerFactory<TrendingNewsCubit>(() => TrendingNewsCubit(
          getTrendingNewsUseCase: GetIt.I.get<GetTrendingNewsUseCase>(),
        )..getNews());
    GetIt.I.registerFactory<HighlightNewsCubit>(() => HighlightNewsCubit(
          getHighlightNewsUseCase: GetIt.I.get<GetHighlightNewsUseCase>(),
        )..getNews());
    GetIt.I.registerFactory<ShowcaseNewsCubit>(() => ShowcaseNewsCubit(
          getShowcaseNewsUseCase: GetIt.I.get<GetShowcaseNewsUseCase>(),
        )..getNews());
    GetIt.I.registerFactory<NewsCategoryCubit>(() => NewsCategoryCubit(
          getNewsCategoriesUseCase: GetIt.I.get<GetCategoriesUseCase>(),
        )..getCategories());
    GetIt.I.registerFactoryParam<NewsDetailCubit, String, void>(
        (param1, param2) => NewsDetailCubit(
              getNewsDetailUseCase: GetIt.I.get<GetNewsDetailUseCase>(),
            )..getNewsDetail(id: param1));
    GetIt.I.registerFactoryParam<CategoryNewsListCubit, String, void>(
        (param1, param2) => CategoryNewsListCubit(
              getCategoryNewsListUseCase: GetIt.I.get<GetCategoryNewsUseCase>(),
            )..getCategoryNews(categorySlug: param1));
    GetIt.I.registerFactoryParam<LatestCategoryNewsListCubit, String, void>(
        (param1, param2) => LatestCategoryNewsListCubit(
              getLatestCategoryNewsListUseCase:
                  GetIt.I.get<GetLatestNewsByCategoryUseCase>(),
            )..getCategoryNews(categoryId: param1));
    GetIt.I.registerFactoryParam<RelatedNewsCubit, String, void>(
        (param1, param2) => RelatedNewsCubit(
              getRelatedNewsUseCase: GetIt.I.get<GetRelatedNewsUseCase>(),
            )..getRelatedNews(newsId: param1));
    GetIt.I.registerFactoryParam<AuthorNewsCubit, String, void>(
        (param1, param2) => AuthorNewsCubit(
              getAuthorNewsUseCase: GetIt.I.get<GetNewsByAuthorUseCase>(),
            )..getAuthorNews(authorId: param1));
  }

  static MultiBlocProvider newsMultiBlocProvider({
    @required Widget child,
  }) =>
      MultiBlocProvider(
        providers: [
          BlocProvider<NewsListCubit>(
            create: (context) => GetIt.I.get<NewsListCubit>(),
          ),
          BlocProvider<HighlightNewsCubit>(
            create: (context) => GetIt.I.get<HighlightNewsCubit>(),
          ),
          BlocProvider<ShowcaseNewsCubit>(
            create: (context) => GetIt.I.get<ShowcaseNewsCubit>(),
          ),
          BlocProvider<TrendingNewsCubit>(
            create: (context) => GetIt.I.get<TrendingNewsCubit>(),
          ),
          BlocProvider<LatestNewsCubit>(
            create: (context) => GetIt.I.get<LatestNewsCubit>(),
          ),
          BlocProvider<NewsCategoryCubit>(
            create: (context) => GetIt.I.get<NewsCategoryCubit>(),
          ),
        ],
        child: child,
      );

  static BlocProvider<NewsListCubit> newsBlocProvider({
    @required Widget child,
  }) =>
      BlocProvider<NewsListCubit>(
        create: (context) => GetIt.I.get<NewsListCubit>(),
        child: child,
      );

  static BlocProvider<LatestNewsCubit> latestNewsBlocProvider({
    @required Widget child,
  }) =>
      BlocProvider<LatestNewsCubit>(
        create: (context) => GetIt.I.get<LatestNewsCubit>(),
        child: child,
      );

  static BlocProvider<TrendingNewsCubit> trendingNewsBlocProvider({
    @required Widget child,
  }) =>
      BlocProvider<TrendingNewsCubit>(
        create: (context) => GetIt.I.get<TrendingNewsCubit>(),
        child: child,
      );

  static BlocProvider<HighlightNewsCubit> highlightNewsBlocProvider({
    @required Widget child,
  }) =>
      BlocProvider<HighlightNewsCubit>(
        create: (context) => GetIt.I.get<HighlightNewsCubit>(),
        child: child,
      );

  static BlocProvider<ShowcaseNewsCubit> showcaseNewsBlocProvider({
    @required Widget child,
  }) =>
      BlocProvider<ShowcaseNewsCubit>(
        create: (context) => GetIt.I.get<ShowcaseNewsCubit>(),
        child: child,
      );

  static BlocProvider<CategoryNewsListCubit> categoryNewsBlocProvider({
    @required Widget child,
    @required String id,
  }) =>
      BlocProvider<CategoryNewsListCubit>(
        create: (context) => GetIt.I.get<CategoryNewsListCubit>(param1: id),
        child: child,
      );

  static BlocProvider<LatestCategoryNewsListCubit>
      latestCategoryNewsBlocProvider({
    @required Widget child,
    @required String id,
  }) =>
          BlocProvider<LatestCategoryNewsListCubit>(
            create: (context) =>
                GetIt.I.get<LatestCategoryNewsListCubit>(param1: id),
            child: child,
          );

  static BlocProvider<RelatedNewsCubit> relatedNewsBlocProvider({
    @required Widget child,
    @required String newsId,
  }) =>
      BlocProvider<RelatedNewsCubit>(
        create: (context) => GetIt.I.get<RelatedNewsCubit>(param1: newsId),
        child: child,
      );

  static BlocProvider<AuthorNewsCubit> authorNewsBlocProvider({
    @required Widget child,
    @required String authorId,
  }) =>
      BlocProvider<AuthorNewsCubit>(
        create: (context) => GetIt.I.get<AuthorNewsCubit>(param1: authorId),
        child: child,
      );

  static BlocProvider<NewsDetailCubit> newsDetailBlocProvider({
    @required Widget child,
    @required String id,
  }) =>
      BlocProvider<NewsDetailCubit>(
        create: (context) => GetIt.I.get<NewsDetailCubit>(param1: id),
        child: child,
      );
}
