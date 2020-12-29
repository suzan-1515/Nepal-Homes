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
import 'package:nepal_homes/feature_news/domain/usecases/get_category_news_use_case.dart';
import 'package:nepal_homes/feature_news/domain/usecases/get_highlight_news_use_case.dart';
import 'package:nepal_homes/feature_news/domain/usecases/get_latest_news_by_category_use_case.dart';
import 'package:nepal_homes/feature_news/domain/usecases/get_latest_news_use_case.dart';
import 'package:nepal_homes/feature_news/domain/usecases/get_news_use_case.dart';
import 'package:nepal_homes/feature_news/domain/usecases/get_showcase_news_use_case.dart';
import 'package:nepal_homes/feature_news/domain/usecases/get_trending_news_use_case.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/latest_news/latest_news_cubit.dart';
import 'package:nepal_homes/feature_news/presentation/cubits/news_list/news_list_cubit.dart';

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

    GetIt.I.registerFactory<NewsListCubit>(() => NewsListCubit(
          getNewsUseCase: GetIt.I.get<GetNewsUseCase>(),
        )..getNews());
    GetIt.I.registerFactory<LatestNewsCubit>(() => LatestNewsCubit(
          getLatestNewsUseCase: GetIt.I.get<GetLatestNewsUseCase>(),
        )..getNews());
  }

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
}
