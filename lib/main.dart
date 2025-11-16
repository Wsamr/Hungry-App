import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app_sonic/core/cached/cache_helper.dart';
import 'package:restaurant_app_sonic/core/constants/route_names.dart';
import 'package:restaurant_app_sonic/core/service/service_locator.dart';
import 'package:restaurant_app_sonic/core/utils/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await setUpServiceLocator();
  // runApp(const ReataurnantApp());
  // final response = await ProfileRepoImp(
  //   apiConsumer: DioConsumer(dio: Dio()),
  // ).updateProfileInfo(UpdateProfileModel(email: "wessamReda@gmail.com"));
  // print(response);
  // final response = await ProfileRepoImp(
  //   apiConsumer: DioConsumer(dio: Dio()),
  // ).getProfileInfo();
  // print(response.profileDataModel.email);
  // final response = await ProfileRepoImp(
  //   apiConsumer: DioConsumer(dio: Dio()),
  // ).logout();
  // print(response.profileDataModel);
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
      initialRoute: RouteNames.bottomNavWidget,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
