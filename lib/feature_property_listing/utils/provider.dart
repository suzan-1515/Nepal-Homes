import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nepal_homes/core/network/http_manager/http_manager.dart';
import 'package:nepal_homes/core/network/network_info.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_property_listing/data/datasources/remote/property_remote_data_source.dart';
import 'package:nepal_homes/feature_property_listing/data/datasources/remote/remote_data_source.dart';
import 'package:nepal_homes/feature_property_listing/data/repositories/property_repository.dart';
import 'package:nepal_homes/feature_property_listing/data/services/property_remote_service.dart';
import 'package:nepal_homes/feature_property_listing/data/services/remote_service.dart';
import 'package:nepal_homes/feature_property_listing/domain/entities/property_query.dart';
import 'package:nepal_homes/feature_property_listing/domain/repositories/repository.dart';
import 'package:nepal_homes/feature_property_listing/domain/usecases/get_property_meta_use_case.dart';
import 'package:nepal_homes/feature_property_listing/domain/usecases/usecases.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/featured_property_list/featured_property_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/hot_property_list/hot_property_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/property_category/property_category_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/property_detail/property_detail_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/property_filter/property_filter_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/property_list/property_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/recent_property_list/recent_property_cubit.dart';

class PropertyProvider {
  PropertyProvider._();

  static setup() {
    GetIt.I.registerLazySingleton<RemoteService>(
        () => PropertyRemoteService(GetIt.I.get<HttpManager>()));
    GetIt.I.registerLazySingleton<RemoteDataSource>(
        () => PropertyRemoteDataSource(GetIt.I.get<RemoteService>()));
    GetIt.I.registerLazySingleton<Repository>(() => PropertyRepository(
        GetIt.I.get<RemoteDataSource>(),
        GetIt.I.get<AnalyticsService>(),
        GetIt.I.get<NetworkInfo>()));

    GetIt.I.registerLazySingleton<GetPropertiesUseCase>(
        () => GetPropertiesUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetHotPropertiesUseCase>(
        () => GetHotPropertiesUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetFeaturedPropertiesUseCase>(
        () => GetFeaturedPropertiesUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetRecentPropertiesUseCase>(
        () => GetRecentPropertiesUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetPremiumPropertiesUseCase>(
        () => GetPremiumPropertiesUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetPropertiesByAgencyUseCase>(
        () => GetPropertiesByAgencyUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetPropertyDetailUseCase>(
        () => GetPropertyDetailUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetPropertyMetaUseCase>(
        () => GetPropertyMetaUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetPropertyCategoriesUseCase>(
        () => GetPropertyCategoriesUseCase(GetIt.I.get<Repository>()));

    GetIt.I.registerFactory<PropertyCubit>(() => PropertyCubit(
          getPropertiesUseCase: GetIt.I.get<GetPropertiesUseCase>(),
        ));
    GetIt.I.registerFactory<HotPropertyCubit>(() => HotPropertyCubit(
          getHotPropertiesUseCase: GetIt.I.get<GetHotPropertiesUseCase>(),
        )..getProperties());
    GetIt.I.registerFactory<FeaturedPropertyCubit>(() => FeaturedPropertyCubit(
          getFeaturedPropertiesUseCase:
              GetIt.I.get<GetFeaturedPropertiesUseCase>(),
        )..getProperties());
    GetIt.I.registerFactory<RecentPropertyCubit>(() => RecentPropertyCubit(
          getRecentPropertiesUseCase: GetIt.I.get<GetRecentPropertiesUseCase>(),
        )..getProperties());

    GetIt.I.registerFactoryParam<PropertyDetailCubit, String, void>(
        (param1, param2) => PropertyDetailCubit(
              getPropertyDetailUseCase: GetIt.I.get<GetPropertyDetailUseCase>(),
            )..getDetail(slug: param1));
    GetIt.I.registerFactoryParam<PropertyFilterCubit, PropertyQuery, void>(
        (param1, param2) => PropertyFilterCubit(
              getPropertyMetaUseCase: GetIt.I.get<GetPropertyMetaUseCase>(),
            )..getMeta(query: param1));
    GetIt.I.registerFactory<PropertyCategoryCubit>(() => PropertyCategoryCubit(
          getPropertyCategoriesUseCase:
              GetIt.I.get<GetPropertyCategoriesUseCase>(),
        )..getCategories());
  }

  static BlocProvider<PropertyCubit> propertyBlocProvider({
    @required Widget child,
  }) =>
      BlocProvider<PropertyCubit>(
        create: (context) => GetIt.I.get<PropertyCubit>(),
        child: child,
      );

  static BlocProvider<HotPropertyCubit> hotPropertyBlocProvider({
    @required Widget child,
  }) =>
      BlocProvider<HotPropertyCubit>(
        create: (context) => GetIt.I.get<HotPropertyCubit>(),
        child: child,
      );

  static BlocProvider<FeaturedPropertyCubit> featuredPropertyBlocProvider({
    @required Widget child,
  }) =>
      BlocProvider<FeaturedPropertyCubit>(
        create: (context) => GetIt.I.get<FeaturedPropertyCubit>(),
        child: child,
      );

  static BlocProvider<RecentPropertyCubit> recentPropertyBlocProvider({
    @required Widget child,
  }) =>
      BlocProvider<RecentPropertyCubit>(
        create: (context) => GetIt.I.get<RecentPropertyCubit>(),
        child: child,
      );

  static BlocProvider<PropertyCategoryCubit> propertyCategoryBlocProvider({
    @required Widget child,
  }) =>
      BlocProvider<PropertyCategoryCubit>(
        create: (context) => GetIt.I.get<PropertyCategoryCubit>(),
        child: child,
      );

  static MultiBlocProvider propertyMultiBlocProvider({
    @required Widget child,
    PropertyQuery query,
  }) =>
      MultiBlocProvider(
        providers: [
          BlocProvider<PropertyCubit>(
            create: (context) => GetIt.I.get<PropertyCubit>(),
          ),
          BlocProvider<PropertyFilterCubit>(
            create: (context) =>
                GetIt.I.get<PropertyFilterCubit>(param1: query),
          ),
        ],
        child: child,
      );

  static BlocProvider<PropertyDetailCubit> propertyDetailBlocProvider({
    @required Widget child,
    @required String slug,
  }) =>
      BlocProvider<PropertyDetailCubit>(
        create: (context) => GetIt.I.get<PropertyDetailCubit>(param1: slug),
        child: child,
      );

  static BlocProvider<PropertyFilterCubit> propertyMetaBlocProvider({
    @required Widget child,
  }) =>
      BlocProvider<PropertyFilterCubit>(
        create: (context) => GetIt.I.get<PropertyFilterCubit>(),
        child: child,
      );
}
