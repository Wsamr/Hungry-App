import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/api/dio_consumer.dart';
import 'package:restaurant_app_sonic/core/cached/cache_helper.dart';
import 'package:restaurant_app_sonic/core/constants/cache_keys.dart';
import 'package:restaurant_app_sonic/core/constants/route_names.dart';
import 'package:restaurant_app_sonic/core/service/service_locator.dart';
import 'package:restaurant_app_sonic/core/utils/app_routes.dart';
import 'package:restaurant_app_sonic/features/auth/data/models/register_models/register_request_model.dart';
import 'package:restaurant_app_sonic/features/auth/data/repo/auth_repo.dart';
import 'package:restaurant_app_sonic/features/profile/data/repo/profile_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await setUpServiceLocator();

  // await CacheHelper().removeData(CacheKeys.token);
  // runApp(const ReataurnantApp());
  // final response = await ProfileRepoImp(
  //   apiConsumer: DioConsumer(dio: Dio()),
  // ).updateProfileInfo(UpdateProfileModel(email: "wessamReda@gmail.com"));
  // print(response);
  // final response = await ProfileRepoImp(
  //   apiConsumer: DioConsumer(dio: Dio()),
  // ).getProfileInfo();
  // print(response.profileDataModel!.email);
  // final response = await ProfileRepoImp(
  //   apiConsumer: DioConsumer(dio: Dio()),
  // ).logout();
  // print(response.profileDataModel);

  // final response = await sl<AuthRepo>().register(
  //   RegisterRequestModel(
  //     name: "wessam",
  //     email: "wsamr600@gmail.com",
  //     phone: "01093453040",
  //     password: "Awm12345!",
  //     image: null,
  //   ),
  // );
  // print(response);

  runApp(
    DevicePreview(
      builder: (context) => ReataurnantApp(), // Wrap your app
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
