import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nepal_homes/core/network/http_manager/http_manager.dart';
import 'package:nepal_homes/core/network/network_info.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_agencies/data/datasources/local/agency_remote_data_source.dart';
import 'package:nepal_homes/feature_agencies/data/datasources/local/remote_data_source.dart';
import 'package:nepal_homes/feature_agencies/data/repositories/agency_repository.dart';
import 'package:nepal_homes/feature_agencies/data/services/agency_remote_service.dart';
import 'package:nepal_homes/feature_agencies/data/services/remote_service.dart';
import 'package:nepal_homes/feature_agencies/domain/repositories/repository.dart';
import 'package:nepal_homes/feature_agencies/domain/usecases/usecases.dart';
import 'package:nepal_homes/feature_agencies/presentation/cubits/agency_detail/agency_detail_cubit.dart';
import 'package:nepal_homes/feature_agencies/presentation/cubits/agency_list/agency_cubit.dart';

class AgencyProvider {
  AgencyProvider._();
  static setup() {
    GetIt.I.registerLazySingleton<RemoteService>(
        () => AgencyRemoteService(GetIt.I.get<HttpManager>()));
    GetIt.I.registerLazySingleton<RemoteDataSource>(
        () => AgencyRemoteDataSource(GetIt.I.get<RemoteService>()));
    GetIt.I.registerLazySingleton<Repository>(() => AgencyRepository(
        GetIt.I.get<RemoteDataSource>(),
        GetIt.I.get<AnalyticsService>(),
        GetIt.I.get<NetworkInfo>()));

    GetIt.I.registerLazySingleton<GetAgenciesUseCase>(
        () => GetAgenciesUseCase(GetIt.I.get<Repository>()));
    GetIt.I.registerLazySingleton<GetAgencyDetailUseCase>(
        () => GetAgencyDetailUseCase(GetIt.I.get<Repository>()));

    GetIt.I.registerFactory<AgencyCubit>(() => AgencyCubit(
          getAgenciesUseCase: GetIt.I.get<GetAgenciesUseCase>(),
          getAgencyDetailUseCase: GetIt.I.get<GetAgencyDetailUseCase>(),
        )..getAgencies());
    GetIt.I.registerFactoryParam<AgencyDetailCubit, String, void>(
        (param1, param2) => AgencyDetailCubit(
              getAgencyDetailUseCase: GetIt.I.get<GetAgencyDetailUseCase>(),
            )..getDetail(id: param1));
  }

  static BlocProvider<AgencyCubit> agencyBlocProvider({
    @required Widget child,
  }) =>
      BlocProvider<AgencyCubit>(
        create: (context) => GetIt.I.get<AgencyCubit>(),
        child: child,
      );
  static BlocProvider<AgencyDetailCubit> agencyDetailBlocProvider({
    @required Widget child,
    @required String id,
  }) =>
      BlocProvider<AgencyDetailCubit>(
        create: (context) => GetIt.I.get<AgencyDetailCubit>(param1: id),
        child: child,
      );
}
