import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_app_sonic/core/api/dio_consumer.dart';
import 'package:restaurant_app_sonic/core/cached/cache_helper.dart';
import 'package:restaurant_app_sonic/features/auth/cubit/auth_cubit.dart';
import 'package:restaurant_app_sonic/features/auth/data/repo/auth_repo.dart';
import 'package:restaurant_app_sonic/features/home/cubit/home_cubit.dart';
import 'package:restaurant_app_sonic/features/onboarding/data/repo/onboarding_repository.dart';
import 'package:restaurant_app_sonic/features/onboarding/view_model/onboarding_view_model.dart';
import 'package:restaurant_app_sonic/features/profile/cubit/profile_cubit.dart';
import 'package:restaurant_app_sonic/features/profile/data/repo/profile_repo.dart';

GetIt sl = GetIt.instance;

setUpServiceLocator() {
  // onboarding
  sl.registerLazySingleton(() => OnboardingRepository());
  sl.registerLazySingleton(
    () => OnboardingViewModel(sl<OnboardingRepository>()),
  );
  // dio client
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton(DioConsumer(dio: sl<Dio>()));

  sl.registerSingleton<CacheHelper>(CacheHelper());

  // auth
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImple(apiConsumer: sl<DioConsumer>()),
  );
  // sl.registerLazySingleton<AuthRepo>(() => AuthRepoImple());

  // profile

  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImp(apiConsumer: sl<DioConsumer>()),
  );
  sl.registerFactory(
    () => AuthCubit(authRepo: sl<AuthRepo>(), cacheHelper: sl<CacheHelper>()),
  );
  sl.registerFactory(() => HomeCubit());

  sl.registerFactory(() => ProfileCubit(profileRepo: sl<ProfileRepo>()));
}
