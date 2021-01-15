import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nepal_homes/core/network/http_manager/http_manager.dart';
import 'package:nepal_homes/core/services/services.dart';
import 'package:nepal_homes/feature_profile/data/datasources/remote/remote_data_source.dart';
import 'package:nepal_homes/feature_profile/data/datasources/remote/user_profile_remote_data_source_.dart';
import 'package:nepal_homes/feature_profile/data/repositories/user_profile_repository.dart';
import 'package:nepal_homes/feature_profile/data/services/remote_service.dart';
import 'package:nepal_homes/feature_profile/data/services/user_profile_service.dart';
import 'package:nepal_homes/feature_profile/domain/repositories/repository.dart';
import 'package:nepal_homes/feature_profile/domain/usecases/get_profile_use_case.dart';
import 'package:nepal_homes/feature_profile/presentation/cubits/user_profile_cubit.dart';

class UserProfileProviders {
  UserProfileProviders._();

  static setup() {
    GetIt.I.registerLazySingleton<RemoteService>(
      () => UserProfileRemoteService(
        GetIt.I.get<HttpManager>(),
      ),
    );
    GetIt.I.registerLazySingleton<RemoteDataSource>(
      () => UserProfileRemoteDataSource(
        GetIt.I.get<RemoteService>(),
      ),
    );

    GetIt.I.registerLazySingleton<Repository>(
      () => UserProfileRepository(
        GetIt.I.get<RemoteDataSource>(),
        GetIt.I.get<AnalyticsService>(),
      ),
    );
    GetIt.I.registerLazySingleton<GetProfileUseCase>(
      () => GetProfileUseCase(
        GetIt.I.get<Repository>(),
      ),
    );

    GetIt.I.registerFactory<UserProfileCubit>(
      () => UserProfileCubit(
        getProfileUseCase: GetIt.I.get<GetProfileUseCase>(),
      )..getProfile(),
    );
  }

  static BlocProvider<UserProfileCubit> userProfileBlocProvider(
          {@required Widget child}) =>
      BlocProvider<UserProfileCubit>(
        create: (context) => GetIt.I.get<UserProfileCubit>(),
        child: child,
      );
}
