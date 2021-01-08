import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nepal_homes/core/network/http_manager/http_manager.dart';
import 'package:nepal_homes/core/network/network_info.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_auth/data/repositories/auth_repository.dart';
import 'package:nepal_homes/feature_property_enquiry/data/datasources/remote/property_enquiry_remote_data_source_.dart';
import 'package:nepal_homes/feature_property_enquiry/data/datasources/remote/remote_data_source.dart';
import 'package:nepal_homes/feature_property_enquiry/data/repositories/property_enquiry_repository.dart';
import 'package:nepal_homes/feature_property_enquiry/data/services/property_enquiry_remote_service.dart';
import 'package:nepal_homes/feature_property_enquiry/data/services/remote_service.dart';
import 'package:nepal_homes/feature_property_enquiry/domain/repositories/repository.dart';
import 'package:nepal_homes/feature_property_enquiry/domain/usecases/post_property_enquiry_use_case.dart';
import 'package:nepal_homes/feature_property_enquiry/presentation/cubits/property_enquiry_cubit.dart';

class PropertyEnquiryProviders {
  PropertyEnquiryProviders._();

  static setup() {
    GetIt.I.registerLazySingleton<RemoteService>(() =>
        PropertyEnquiryRemoteService(
            GetIt.I.get<HttpManager>(), GetIt.I.get<AuthRepository>()));
    GetIt.I.registerLazySingleton<RemoteDataSource>(
        () => PropertyEnquiryRemoteDataSource(GetIt.I.get<RemoteService>()));
    GetIt.I.registerLazySingleton<Repository>(() => PropertyEnquiryRepository(
        GetIt.I.get<RemoteDataSource>(),
        GetIt.I.get<AnalyticsService>(),
        GetIt.I.get<NetworkInfo>()));

    GetIt.I.registerLazySingleton<PostPropertyEnquiryUseCase>(
        () => PostPropertyEnquiryUseCase(GetIt.I.get<Repository>()));

    GetIt.I.registerFactory<PropertyEnquiryCubit>(
      () => PropertyEnquiryCubit(
        postPropertyEnquiryUseCase: GetIt.I.get<PostPropertyEnquiryUseCase>(),
      ),
    );
  }

  static BlocProvider<PropertyEnquiryCubit> propertyEnquiryBlocProvider(
          {@required Widget child}) =>
      BlocProvider<PropertyEnquiryCubit>(
        create: (context) => GetIt.I.get<PropertyEnquiryCubit>(),
        child: child,
      );
}
