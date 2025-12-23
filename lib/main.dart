import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app_sonic/core/cached/cache_helper.dart';
import 'package:restaurant_app_sonic/core/constants/cache_keys.dart';
import 'package:restaurant_app_sonic/core/constants/route_names.dart';
import 'package:restaurant_app_sonic/core/service/service_locator.dart';
import 'package:restaurant_app_sonic/core/utils/app_routes.dart';
import 'package:restaurant_app_sonic/features/auth/cubit/auth_cubit.dart';
import 'package:restaurant_app_sonic/features/cart/cart_cubit/cart_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await setUpServiceLocator();

  // await CacheHelper().removeData(CacheKeys.token);
  // await CacheHelper().removeData(CacheKeys.isVisited);
  // runApp(
  //   DevicePreview(
  //     builder: (context) => ReataurnantApp(), // Wrap your app
  //   ),
  // );
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<CartCubit>())],
      child: ReataurnantApp(),
    ),
  );
}

class ReataurnantApp extends StatelessWidget {
  const ReataurnantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      // home: HomeView(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      initialRoute: RouteNames.splashView,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
