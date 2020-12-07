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
import 'package:nepal_homes/feature_property_listing/domain/repositories/repository.dart';
import 'package:nepal_homes/feature_property_listing/domain/usecases/get_property_meta_use_case.dart';
import 'package:nepal_homes/feature_property_listing/domain/usecases/usecases.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/property_detail/property_detail_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/property_filter/property_filter_cubit.dart';
import 'package:nepal_homes/feature_property_listing/presentation/cubits/property_list/property_cubit.dart';

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
    GetIt.I.registerLazySingleton<GetPropertiesByAgencyUseCase>(
        () => GetPropertiesByAgencyUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetPropertyDetailUseCase>(
        () => GetPropertyDetailUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetPropertyMetaUseCase>(
        () => GetPropertyMetaUseCase(GetIt.I.get<Repository>()));

    GetIt.I.registerFactory<PropertyCubit>(() => PropertyCubit(
          getPropertiesUseCase: GetIt.I.get<GetPropertiesUseCase>(),
        ));
    GetIt.I.registerFactoryParam<PropertyDetailCubit, String, void>(
        (param1, param2) => PropertyDetailCubit(
              getPropertyDetailUseCase: GetIt.I.get<GetPropertyDetailUseCase>(),
            )..getDetail(slug: param1));
    GetIt.I.registerFactory<PropertyFilterCubit>(() => PropertyFilterCubit(
          getPropertyMetaUseCase: GetIt.I.get<GetPropertyMetaUseCase>(),
        )..getMeta());
  }

  static BlocProvider<PropertyCubit> propertyBlocProvider({
    @required Widget child,
  }) =>
      BlocProvider<PropertyCubit>(
        create: (context) => GetIt.I.get<PropertyCubit>(),
        child: child,
      );
  static MultiBlocProvider propertyMultiBlocProvider({
    @required Widget child,
  }) =>
      MultiBlocProvider(
        providers: [
          BlocProvider<PropertyCubit>(
            create: (context) => GetIt.I.get<PropertyCubit>(),
          ),
          BlocProvider<PropertyFilterCubit>(
            create: (context) => GetIt.I.get<PropertyFilterCubit>(),
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
