import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurant_app_sonic/core/api/api_consumer.dart';
import 'package:restaurant_app_sonic/core/api/dio_consumer.dart';
import 'package:restaurant_app_sonic/core/cached/cache_helper.dart';
import 'package:restaurant_app_sonic/features/auth/cubit/auth_cubit.dart';
import 'package:restaurant_app_sonic/features/auth/data/repo/auth_repo.dart';
import 'package:restaurant_app_sonic/features/cart/cart_cubit/cart_cubit.dart';
import 'package:restaurant_app_sonic/features/cart/data/repo/cart_repo.dart';
import 'package:restaurant_app_sonic/features/cart/data/web/cart_web_service.dart';
import 'package:restaurant_app_sonic/features/home/cubit/home_cubit.dart';
import 'package:restaurant_app_sonic/features/home/data/repo/home_repo.dart';
import 'package:restaurant_app_sonic/features/home/data/web/home_web_services.dart';
import 'package:restaurant_app_sonic/features/onboarding/data/repo/onboarding_repository.dart';
import 'package:restaurant_app_sonic/features/onboarding/view_model/onboarding_view_model.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/cubit/order_history_cubit.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/data/repo/order_history_repo.dart';
import 'package:restaurant_app_sonic/features/orders_history/presentation/data/web/order_history_web_service.dart';
import 'package:restaurant_app_sonic/features/product/logic/addtocart_cubit/product_selection_cubit.dart';
import 'package:restaurant_app_sonic/features/product/logic/options_cubit/product_options_cubit.dart';
import 'package:restaurant_app_sonic/features/product/data/repo/product_repo.dart';
import 'package:restaurant_app_sonic/features/product/data/web/product_web_service.dart';
import 'package:restaurant_app_sonic/features/profile/cubit/profile_cubit.dart';
import 'package:restaurant_app_sonic/features/profile/data/repo/profile_repo.dart';
import 'package:restaurant_app_sonic/features/profile/data/web/profile_web_service.dart';

GetIt sl = GetIt.instance;

setUpServiceLocator() {
  // onboarding
  sl.registerLazySingleton(() => OnboardingRepository());
  sl.registerLazySingleton(
    () => OnboardingViewModel(sl<OnboardingRepository>()),
  );
  // dio consumer
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<ApiConsumer>(DioConsumer(dio: sl<Dio>()));

  sl.registerSingleton<CacheHelper>(CacheHelper());

  // auth
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImple(apiConsumer: sl<ApiConsumer>()),
  );
  sl.registerLazySingleton<HomeWebServices>(
    () => HomeWebServices(apiConsumer: sl<ApiConsumer>()),
  );
  sl.registerLazySingleton<CartWebService>(
    () => CartWebService(apiConsumer: sl<ApiConsumer>()),
  );
  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImple(homeWebServices: sl<HomeWebServices>()),
  );
  sl.registerLazySingleton<CartRepo>(
    () => CartRepoImple(cartWebService: sl<CartWebService>()),
  );
  sl.registerLazySingleton<ProductRepo>(
    () => ProductRepoImple(productWebService: sl<ProductWebService>()),
  );
  // sl.registerLazySingleton<AuthRepo>(() => AuthRepoImple());

  // profile

  sl.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImp(profileWebService: sl<ProfileWebService>()),
  );
  sl.registerLazySingleton<ProfileWebService>(
    () => ProfileWebService(apiConsumer: sl<ApiConsumer>()),
  );
  sl.registerLazySingleton<ProductWebService>(
    () => ProductWebService(apiConsumer: sl<ApiConsumer>()),
  );
  sl.registerFactory(
    () => AuthCubit(authRepo: sl<AuthRepo>(), cacheHelper: sl<CacheHelper>()),
  );
  sl.registerFactory(() => HomeCubit(sl<HomeRepo>()));

  sl.registerFactory(() => ProfileCubit(profileRepo: sl<ProfileRepo>()));
  sl.registerFactory(() => CartCubit(sl<CartRepo>()));
  sl.registerFactory(() => ProductOptionsCubit(sl<ProductRepo>()));

  // order history
  //data layer
  sl.registerSingleton<OrderHistoryWebService>(
    OrderHistoryWebService(apiConsumer: sl<ApiConsumer>()),
  );
  sl.registerSingleton<OrderHistoryRepo>(
    OrderHistoryRepoImple(orderHistoryWebService: sl<OrderHistoryWebService>()),
  );
  // logic
  sl.registerFactory<OrderHistoryCubit>(
    () => OrderHistoryCubit(sl<OrderHistoryRepo>()),
  );
}
